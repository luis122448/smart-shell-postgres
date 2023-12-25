ALTER DATABASE smart_shell SET search_path TO smart_shell;
ALTER DATABASE smart_shell SET client_encoding TO 'UTF8';
ALTER DATABASE smart_shell SET lc_collate TO 'es_ES.UTF-8';
ALTER DATABASE smart_shell SET lc_ctype TO 'es_ES.UTF-8';
ALTER DATABASE smart_shell SET timezone TO 'America/Lima';
ALTER DATABASE smart_shell SET datestyle TO 'ISO, DMY';
ALTER DATABASE smart_shell SET intervalstyle TO 'iso_8601';
ALTER DATABASE smart_shell SET bytea_output TO 'escape';
ALTER DATABASE smart_shell SET standard_conforming_strings TO 'on';

-- Schema
CREATE SCHEMA smart_shell;

-- Rol and Privileges
CREATE ROLE role_smart_shell;

-- Privileges to schema ( All )
GRANT ALL PRIVILEGES ON SCHEMA smart_shell TO role_smart_shell;
ALTER DEFAULT PRIVILEGES IN SCHEMA smart_shell
    GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO role_smart_shell;

-- User and Privileges
CREATE USER developer_smart_shell WITH PASSWORD '1073741824' LOGIN;
CREATE USER user_smart_shell WITH PASSWORD '1073741824' LOGIN;

-- Assign role
GRANT role_smart_shell TO developer_smart_shell;
GRANT role_smart_shell TO user_smart_shell;

-- User schema default
ALTER ROLE role_smart_shell SET search_path = smart_shell;

-- Change schema
SET search_path TO smart_shell;