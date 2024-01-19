-- Configuración de parámetros
ALTER SYSTEM SET shared_buffers = '512MB';
ALTER SYSTEM SET work_mem = '64MB';
ALTER SYSTEM SET effective_cache_size = '2GB';

-- Nombre de la base de datos
CREATE DATABASE platform_training;

-- Cambia al contexto de la nueva base de datos
\c platform_training;

-- Crear un usuario con privilegios de superusuario (puedes personalizar según tus necesidades)
CREATE USER nombre_de_usuario WITH PASSWORD 'tu_contraseña' SUPERUSER;

-- Habilitar las extensiones necesarias (puedes agregar otras según tus necesidades)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Otorgar permisos al usuario sobre la base de datos
GRANT ALL PRIVILEGES ON DATABASE platform_training TO nombre_de_usuario;
