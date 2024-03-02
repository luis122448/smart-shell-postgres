![Logo del Projecto](./resources/logo.png)

# Despliegue Automatizado de Base de Datos PostgreSQL con Docker

Este repositorio contiene un conjunto de configuraciones y scrips SQL para desplegar una base de datos PostgreSQL con toda la información (por defecto) para el proyecto de Smart-Shell ( Facturador Electronico ) y el proyecto de Platform-Training ( Plataforma de Capacitacion ) utilizando Docker y Docker Compose. Asimismo se ha configurado la generación de logs y backups de la base de datos.

## Descripción

El objetivo principal de este proyecto es proporcionar un entorno preconfigurado de PostgreSQL utilizando Docker, permitiendo la automatización del despliegue y la inicialización de la base de datos con scripts SQL predefinidos asimismo la automatizacion en la generación y exportación de logs y backups.

## Proyectos Relacionados

### Proyecto Actual
- [Smart-Shell-Postgres](https://github.com/luis122448/smart-shell-postgres)

### Proyectos Relacionados
- [Smart-Shell-Angular](https://github.com/luis122448/smart-shell-angular)
- [Smart-Shell-SpringBoot](https://github.com/luis122448/smart-shell-springboot)
- [Smart-Shell-Bash](https://github.com/luis122448/smart-shell-bash)
- [Smart-Shell-Mongo](https://github.com/luis122448/smart-shell-mongo)
- [Smart-Shell-Redis](https://github.com/luis122448/smart-shell-redis)

## Configuraciones y Scripts Iniciales

- **docker-compose.yml**: Archivo de configuración Docker Compose para crear y ejecutar el contenedor de PostgreSQL.
- **init-scripts/**: Carpeta que contiene los scripts SQL de inicialización de la base de datos.
  - `00 - POSTGEESQL.sql`: Script para la configuración de archivos de log, backups y parametros globales de la base de datos.
  - `01 - MEMORY.sql`: Script para la configuración de la memoria y parametros de rendimiento.
  - `02 - SCHEMA AND ROL.sql`: Script para la configuración de SCHEMAS y ROLES.
  - `03 - UTILS.sql`: Script para creacion de tablas y procedimientos globales
  - `04 - ARTICLE.sql`: Script para la creacion e inserción de articulos y tablas anexas.
  - `05 - BUSINESS_PARTNER.sql`: Script para la creacion e inserción de socios de negocio y tablas anexas.
  - `06 - DOCUMENT_P0.sql`: Script para la creacion de las tablas de cabezera y detalle para los documentos.
  - `07 - DOCUMENT_P1.sql`: Script para la creacion e inserción de las tablas secundarias asociadas a los documentos.
  - `08 - DOCUMENT_P2.sql`: Script para las funciones y procedimientos almacenados necesarios para las insercion, consulta e impresion de los documentos.
  - `09 - DOCUMENT_P2.sql`: Configuraciones adicionales, para el proyecto (no vinculado) de platform-training.
- **configurations**: Archivo con scrips en bash, para configurar y automatizar la generacion de logs y backups de PostgreSQL.

## Configuracion del Entorno

1. **Clonar el Repositorio**
    ```bash
        git clone https://github.com/luis122448/smart-shell-postgres.git
    ```

2. **Ingresar al directorio del proyecto**

    ```bash
        cd smart-shell-postgres
    ```

3. **Ejecutar el script de instalación**
    
    ```bash
        sudo bash dev-install.sh
    ```

4. **Defina las credenciales en el archivo .env**

    ```bash
        nano .env
    ```

    ```env
        POSTGRES_USERNAME=''
        POSTGRES_PASSWORD=''
        POSTGRES_DATABASE=''
    ```

5. **Crear (si no existe) el network**

    ```bash
        sudo docker network create smart-shell-net
    ```

## Scripts

El directorio `init-scripts` contiene los scripts que se ejecutarán al iniciar el contenedor, para crear la base de datos, los esquemas, las tablas y los datos iniciales.
Adicinalmente el dictorio `scripts` contiene scripts auxiliares y utilitarios.

## Despliegue en Producción

Para el despliegue en producción se ha utilizado Docker y Docker Compose, puede revisar el archivo docker-compose.yml para conocer los detalles de la configuración.
Asimismo no se olvide de modificar las variables de entono, en asi archivo .env

1. **Ejecutar el script de despliegue**
    
    ```bash
        sudo bash deploy.sh
    ```

## Revisión del Despliegue

1. **Verificar logs y backups**
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

2. **Conexion a la Base de Datos**
    ```bash
        sudo docker exec -it smart-shell-postgres bash
    ```

3. **Verificando las versiones**

    ```bash
        psql --version
        postgres --version
    ```

4. **Ingresando con el usuario condigurado**

    ```bash
        psql -U <usuario> --password --db smart_shell
        <password>

        SET search_path TO SMART_SHELL;

        SELECT * FROM TBL_ARTICLE;
    ```

## Personalización
Puedes personalizar este entorno modificando los scripts SQL en init-scripts/ según las necesidades específicas de tu base de datos. Recuerda mantener el orden numérico en los nombres de los scripts si necesitas un orden específico de ejecución.

## Cadena de Conexion
 Configuracion para un proyecto de JAVA con SPRING BOOT (application.properties).

    ```bash
        # Postgres configuration
        spring.datasource.postgresql.url=jdbc:postgresql://${POSTGRES_HOST}/${POSTGRES_DATABASE}
        spring.datasource.postgresql.username=${POSTGRES_USERNAME}
        spring.datasource.postgresql.password=${POSTGRES_PASSWORD}
    ```

## Contribuciones
Las contribuciones son bienvenidas. Siéntete libre de mejorar este proyecto, agregar nuevas características o corregir problemas identificados. Para contribuir, crea un Pull Request o abre un Issue.

## Licencia
Este proyecto está bajo la licencia MIT License.