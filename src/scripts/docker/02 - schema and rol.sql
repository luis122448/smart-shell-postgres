ALTER DATABASE ${POSTGRES_DB} SET client_encoding TO 'UTF8';
ALTER DATABASE ${POSTGRES_DB} SET timezone TO 'America/Lima';
ALTER DATABASE ${POSTGRES_DB} SET datestyle TO 'ISO, DMY';
ALTER DATABASE ${POSTGRES_DB} SET intervalstyle TO 'iso_8601';
ALTER DATABASE ${POSTGRES_DB} SET bytea_output TO 'escape';
ALTER DATABASE ${POSTGRES_DB} SET standard_conforming_strings TO 'on';

-- Schema
CREATE SCHEMA smart_shell;

ALTER DATABASE ${POSTGRES_DB} SET search_path TO smart_shell;

-- Rol and Privileges
CREATE ROLE role_smart_shell;

-- Privileges to schema ( All )
GRANT ALL PRIVILEGES ON SCHEMA smart_shell TO role_smart_shell;
ALTER DEFAULT PRIVILEGES IN SCHEMA smart_shell
    GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO role_smart_shell;

-- User and Privileges
CREATE USER developer_smart_shell WITH PASSWORD '${POSTGRES_PASSWORD}' LOGIN;
CREATE USER user_smart_shell WITH PASSWORD '${POSTGRES_PASSWORD}' LOGIN;

-- Assign role
GRANT role_smart_shell TO developer_smart_shell;
GRANT role_smart_shell TO user_smart_shell;

-- User schema default
ALTER ROLE role_smart_shell SET search_path = smart_shell;

-- Change schema
SET search_path TO smart_shell;