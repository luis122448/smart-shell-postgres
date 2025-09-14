# PostgreSQL StatefulSet Configuration

This document explains how to configure a resilient PostgreSQL database on Kubernetes using a `StatefulSet`. It focuses on the role of labels and selectors, which are fundamental for connecting the different Kubernetes components.

Unlike a `Deployment`, a `StatefulSet` is designed for stateful applications like databases. It provides stable, unique network identifiers and stable, persistent storage for each Pod.

## Core Components

A complete PostgreSQL setup involves three main Kubernetes objects:

1.  **Headless Service**: Provides a stable network DNS entry for the database pods. Other applications will use this service to connect to the database.
2.  **StatefulSet**: Manages the PostgreSQL pods, ensuring they are created in order and have persistent storage.
3.  **Secret**: Securely stores sensitive data, like the database password, keeping it out of your configuration files.

---
## 1. The Secret (Dynamic Creation)

Instead of writing a YAML file for the secret, we can create it directly on the command line. This is simpler for a few variables, and `kubectl` handles the required base64 encoding for you.

This single command creates a secret named `postgres-secret` with all the necessary values.

**Command to Create the Secret:**

```bash
kubectl create secret generic postgres-secret \
  --from-literal=POSTGRES_USER='luis122448' \
  --from-literal=POSTGRES_DB='smart_shell' \
  --from-literal=POSTGRES_PASSWORD='your-strong-password' \
  -n smart-shell-production
```

**Note**: Remember to replace `'your-strong-password'` with a real, secure password. If you need to add this secret to a specific namespace, add the `-n your-namespace` flag to the command.

---
## 2. The Headless Service


This service defines a DNS domain for the pods managed by the `StatefulSet`. It's "headless" (`clusterIP: None`) because we don't need a single load-balanced IP. Instead, we want to connect to specific pods directly, which is what the `StatefulSet` manages.

**`postgres-headless-service.yml`**
```yaml
apiVersion: v1
kind: Service
metadata:
  name: postgres-service
  namespace: smart-shell-production
spec:
  # clusterIP: None makes this a "headless" service.
  # It doesn't get a single ClusterIP but instead creates DNS records
  # that point directly to the pods selected below.
  clusterIP: None
  ports:
    - port: 5432
      name: postgres
  # This selector is crucial. The service will look for any Pods
  # that have the label "app: postgres". This is how the service
  # knows which pods are part of the database group.
  selector:
    app: postgres
```

---
## 3. The StatefulSet

This is the main controller for our database pods. It uses a `volumeClaimTemplates` to ensure each pod gets its own unique `PersistentVolume` for storing data.

**`postgres-statefulset.yml`**
```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: postgres-statefulset
  namespace: smart-shell-production
spec:
  # This MUST match the name of the Headless Service defined above.
  # It tells the StatefulSet which service controls the network domain for its pods.
  serviceName: "postgres-service"
  replicas: 1 # Start with one replica for a simple setup
  
  # The StatefulSet's own selector. It will manage any pods that
  # have the label "app: postgres".
  selector:
    matchLabels:
      app: postgres
      
  # This is the template used to create the Pods.
  template:
    metadata:
      # These are the labels applied to each Pod created by this StatefulSet.
      # This MUST match the `selector.matchLabels` above. This is the most
      # common point of confusion:
      #   - `StatefulSet.spec.selector` says "I am looking for pods with this label."
      #   - `StatefulSet.spec.template.metadata.labels` says "Create pods with this label."
      # They must match for the StatefulSet to manage its own pods.
      labels:
        app: postgres
    spec:
      containers:
        - name: postgres
          image: luis122448/smart-shell-postgres:v1.0.0
          ports:
            - containerPort: 5432
              name: postgres
          env:
            - name: POSTGRES_USER
              valueFrom:
                secretKeyRef:
                  name: postgres-secret
                  key: POSTGRES_USER
            - name: POSTGRES_DB
              valueFrom:
                secretKeyRef:
                  name: postgres-secret
                  key: POSTGRES_DB
            - name: POSTGRES_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: postgres-secret
                  key: POSTGRES_PASSWORD
          # Mount the persistent volume inside the container.
          volumeMounts:
            - name: postgres-storage
              mountPath: /var/lib/postgresql/data
              
  # This template defines the PersistentVolumeClaim (PVC) for each pod.
  # When a pod like `postgres-statefulset-0` is created, a PVC named
  # `postgres-storage-postgres-statefulset-0` will be automatically created
  # and bound to a PersistentVolume, ensuring data persistence.
  volumeClaimTemplates:
    - metadata:
        name: postgres-storage
      spec:
        accessModes: ["ReadWriteOnce"]
        storageClassName: "nas-002"
        resources:
          requests:
            storage: 5Gi # Request 5 Gigabytes of storage
```

## Summary of Labels and Selectors

Let's break down the connections:

1.  **`StatefulSet` -> `Pod` Connection**:
    *   The `StatefulSet` has a `spec.selector.matchLabels` field (e.g., `app: postgres`).
    *   This tells the `StatefulSet`: "You are responsible for any Pod that has this label."
    *   The `StatefulSet` also has a `spec.template.metadata.labels` field with the same label (`app: postgres`).
    *   This tells the `StatefulSet`: "When you create a new Pod, apply this label to it."
    *   This creates a loop: The `StatefulSet` creates pods with a label that it then uses to manage them.

2.  **`Service` -> `Pod` Connection**:
    *   The `Service` has a `spec.selector` field (e.g., `app: postgres`).
    *   This tells the `Service`: "Find all Pods with this label and create DNS entries for them."
    *   Since the `StatefulSet` is already creating pods with this label, the `Service` automatically finds them and makes them available on the network (e.g., `postgres-statefulset-0.postgres-service`).

By using this label (`app: postgres`) consistently across all components, you create a robust link between your network, your controller, and your pods.

## 4. Accessing the PostgreSQL Database

There are two independent methods for accessing the database, designed for different use cases.

### Method 1: Access from the Local Network (Via MetalLB)

This method is ideal for development, testing, and for any other application running within your same local area network (LAN).

*   **Technology:** It uses a `LoadBalancer` type service defined in `external-service.yml`. `MetalLB` is responsible for assigning it a local network IP, making it accessible.
*   **Relevant Manifest:** `external-service.yml`
*   **Connection Details:**
    *   **IP Address:** `192.168.100.241` (assigned by MetalLB)
    *   **Port:** `5432`
*   **Usage:** Any client on the same network as the Kubernetes cluster can connect directly to `192.168.100.241:5432`.

### Method 2: External/Public Access (Via frp)

This method is designed to securely expose the database to the internet through an intermediary server (VPS).

*   **Technology:** It uses an `frpc` client (configured via `frpc-configmap.yaml`) running inside the cluster. This client establishes a reverse tunnel to an `frps` server on a public VPS.
*   **Relevant Manifest:** `frpc-configmap.yaml`
*   **Traffic Path:** The `frpc` client connects to the *internal* database service (`postgres-service.smart-shell-production.svc.cluster.local`) and exposes that tunnel on the VPS.
*   **Connection Details:**
    *   **IP Address:** The public IP address of your VPS where `frps` is running.
    *   **Port:** `5432` (or the `remotePort` you have configured in `frpc.toml`).
*   **Usage:** Allows access to the database from anywhere on the internet without directly exposing your cluster's network.

---
## How to Use

1.  **Apply the Secret**:

```bash
kubectl apply -f postgres-secret.yml
```

2.  **Apply the Headless Service**:

```bash
kubectl apply -f postgres-headless-service.yml
```

3.  **Apply the StatefulSet**:

```bash
kubectl apply -f postgres-statefulset.yml
```

4.  **(Optional) Apply the Local Access Service**:

```bash
kubectl apply -f external-service.yml
```