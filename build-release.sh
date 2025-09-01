#!/bin/bash
# Description: Build and deploy application Docker image to Docker Hub.

# --- Configuration ---
DOCKER_USERNAME="luis122448"
IMAGE_NAME="smart-shell-postgres"
IMAGE_TAG="v1.0.0" # Standardized version tag
FULL_IMAGE_NAME="${DOCKER_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"
DOCKERFILE_PATH="." # Path to the directory containing the Dockerfile

# --- Functions ---
error_exit() {
    echo "ERROR: $1" >&2
    exit 1
}

# --- Pre-checks ---
docker info > /dev/null 2>&1 || error_exit "Docker is not running or user lacks permissions."

docker info | grep "Username: $DOCKER_USERNAME" > /dev/null || \
    error_exit "Not logged in to Docker Hub as $DOCKER_USERNAME. Please run 'docker login' manually."

# --- Docker Buildx Setup ---
docker buildx inspect mybuilder > /dev/null 2>&1 || docker buildx create --name mybuilder --bootstrap || \
    error_exit "Failed to create Buildx builder."
docker buildx use mybuilder || error_exit "Failed to use Buildx builder 'mybuilder'."

# --- Build and Push Image ---
echo "Building and pushing ${FULL_IMAGE_NAME} for linux/amd64 and linux/arm64..."
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t "${FULL_IMAGE_NAME}" \
  --push \
  "${DOCKERFILE_PATH}" || error_exit "Failed to build and push Docker image."

echo "Image ${FULL_IMAGE_NAME} successfully deployed to Docker Hub!"
