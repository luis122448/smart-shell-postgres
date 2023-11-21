-- Schema
CREATE SCHEMA smartshell;

-- Rol and Privileges
CREATE ROLE developer;
CREATE ROLE application_smartshell;

-- Privileges to schema ( All )
GRANT ALL PRIVILEGES ON SCHEMA smartshell TO developer, application_smartshell;
ALTER DEFAULT PRIVILEGES IN SCHEMA smartshell
    GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO developer, application_smartshell;

-- User and Privileges
CREATE USER luis122448 WITH PASSWORD '1073741824' LOGIN;
CREATE USER user_smartshell WITH PASSWORD '1073741824' LOGIN;

-- Assign role
GRANT developer TO luis122448;
GRANT application_smartshell TO user_smartshell;

-- User schema default
ALTER ROLE application_smartshell SET search_path = smartshell;
ALTER ROLE developer SET search_path = smartshell;

-- Change schema
SET search_path TO smartshell;