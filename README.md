![Logo del Projecto](./resources/logo.png)

# Despliegue Automatizado de Base de Datos PostgreSQL con Docker

Este repositorio contiene un conjunto de archivos y configuraciones para desplegar y configurar una base de datos PostgreSQL utilizando Docker de forma automatizada.

## Descripción

El objetivo principal de este proyecto es proporcionar un entorno preconfigurado de PostgreSQL utilizando Docker, permitiendo la automatización del despliegue y la inicialización de la base de datos con scripts SQL predefinidos asimismo la automatizacion en la generación y exportación de logs y backups.

## Configuraciones y Scripts Iniciales

- **docker-compose.yml**: Archivo de configuración Docker Compose para crear y ejecutar el contenedor de PostgreSQL.
- **init-scripts/**: Carpeta que contiene los scripts SQL de inicialización de la base de datos.
  - `00 - SCHEMA AND ROL.sql`: Script para la configuración de SCHEMAS y ROLES.
  - `01 - UTILS.sql`: Script para ...
  - `02 - ARTICLE.sql`: Script para ...
  - `03 - BUSINESS_PARTNER.sql`: Script para ...
  - `04 - DOCUMENT_P0.sql`: Script para ...
  - `05 - DOCUMENT_P1.sql`: Script para ...
  - `06 - DOCUMENT_P2.sql`: Script para ...
- **configurations**: Archivo con scrips en bash, para configurar y automatizar la generacion de logs y backups de PostgreSQL.

## Uso

1. **Clonación del Repositorio:**
    ```bash
        git clone https://github.com/luis122448/smart-shell-postgres.git
    ```

2. **Ejecutar el scrip dev-install.sh:**
    ```bash
        cd smart-shell-postgres
        bash dev-install.sh
    ```

2. **Modificar el archivo .env, y asignar las variables de entorno**
    ```bash
        nano .env
    ```

    ```env
        POSTGRES_USER=postgres
        POSTGRES_PASSWORD=<password>
        POSTGRES_DB=smart-shell
    ```
    
    ```bash
        cd smart-shell-postgres/init-scripts
        nano 01 - SCHEMA AND ROL.sql
    ```
    Modificar el script *01 - SCHEMA AND ROL* de inicialización de la base de datos de ser necesario.
    ```sql
        CREATE USER luis122448 WITH PASSWORD '<password>' LOGIN;
        CREATE USER user_smartshell WITH PASSWORD '<password>' LOGIN;
    ```

3. **Creación de la Red:**
    ```bash
        docker network create smart-shell-net
    ```

## Despliegue en Producción

Para el despliegue en producción se ha utilizado Docker y Docker Compose, puede revisar el archivo docker-compose.yml para conocer los detalles de la configuración.
Asimismo no se olvide de modificar las variables de entono, en asi archivo .env

1. Ejecutar el script de despliegue
    
    ```bash
        sudo bash deploy.sh
    ```

## Revisión del Despliegue

1. **Verificar logs y backups.**
    Verificar los registros y respaldos generados durante el arranque del contenedor dentro del directorio de tu proyecto:

    ```bash
        smart-shell-postgres/
        ├── logs/
        │   ├── init-2023-12-02.log
        │   └── log-2023-12-02.log
        ├── backups/
        │   └── backup-20231202_134657.sql
        └── ...
    ```

2. **Conexion a la Base de Datos.**
    ```bash
        sudo docker exec -it postgres-smart-shell bash
    ```

3. **Verificando las versiones.**
    ```bash
        psql --version
        postgres --version
    ```

4. **Ingresando con el usuario condigurado**
    ```bash
        psql -U <usuario> --password --db smart-shell
        <password>

        SET search_path TO SMARTSHELL;

        SELECT * FROM TBL_ARTICLE;
    ```

## Personalización
Puedes personalizar este entorno modificando los scripts SQL en init-scripts/ según las necesidades específicas de tu base de datos. Recuerda mantener el orden numérico en los nombres de los scripts si necesitas un orden específico de ejecución.

## Contribuciones
Las contribuciones son bienvenidas. Siéntete libre de mejorar este proyecto, agregar nuevas características o corregir problemas identificados. Para contribuir, crea un Pull Request o abre un Issue.

## Licencia
Este proyecto está bajo la licencia MIT License.