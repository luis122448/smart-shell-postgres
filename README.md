![Logo del Projecto](./resources/logo.png)

# Despliegue Automatizado de Base de Datos PostgreSQL con Docker

Este repositorio contiene un conjunto de archivos y configuraciones para desplegar y configurar una base de datos PostgreSQL utilizando Docker de forma automatizada.

## Descripción

El objetivo principal de este proyecto es proporcionar un entorno preconfigurado de PostgreSQL utilizando Docker, permitiendo la automatización del despliegue y la inicialización de la base de datos con scripts SQL predefinidos.

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
  
## Uso

1. **Clonación del Repositorio:**
    ```bash
        git clone https://github.com/luis122448/smart-shell-postgres.git
    ```

2. **Modificación del Archivo de Configuración:**
    ```bash
        cd smart-shell-postgres
        nano docker-compose.yml
    ```
    Modificar las variables de entorno del *docker-compose* de ser necesario.
    ```yml
        environment:
            - POSTGRES_USER=postgres
            - POSTGRES_PASSWORD=<password>
            - POSTGRES_DB=smart-shell
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

4. **Creación de la Imagen:**
    ```bash
        sudo bash deploy.sh
    ```
    
5. **Conexion a la Base de Datos.**
    ```bash
        sudo docker exec -it postgres-smart-shell bash
    ```

6. **Verificando las versiones.**
    ```bash
        psql --version
        postgres --version
    ```

7. **Ingresando con el usuario condigurado**
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