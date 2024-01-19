-- Nombre de la base de datos
CREATE DATABASE IF NOT EXISTS platform_training;

-- Cambia al contexto de la nueva base de datos
\c platform_training;

-- Crear un usuario con privilegios de superusuario (puedes personalizar según tus necesidades)
CREATE USER developer WITH PASSWORD '1073741824' SUPERUSER;

-- Habilitar las extensiones necesarias (puedes agregar otras según tus necesidades)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Otorgar permisos al usuario sobre la base de datos
GRANT ALL PRIVILEGES ON DATABASE platform_training TO developer;