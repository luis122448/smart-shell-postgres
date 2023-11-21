-- Rol and Privileges
CREATE ROLE developer;
CREATE ROLE application_smartshell;

-- DROP ROLE developer;
-- DROP ROLE application_smartshell;

-- List rol
-- SELECT * FROM pg_roles;

-- Privileges to schema ( Basic )
GRANT USAGE ON SCHEMA smartshell TO developer;

-- Privileges to schema ( All )
GRANT ALL PRIVILEGES ON SCHEMA smartshell TO developer;

-- Privileges from to user applications ( Personalize )
GRANT USAGE ON SCHEMA smartshell TO application_smartshell;
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL TABLES IN SCHEMA smartshell TO application_smartshell;
GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA smartshell TO application_smartshell;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA smartshell TO application_smartshell;

-- Remove privileges
REVOKE USAGE, SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL TABLES IN SCHEMA smartshell FROM application_smartshell;
REVOKE USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA smartshell FROM application_smartshell;
REVOKE EXECUTE ON ALL FUNCTIONS IN SCHEMA smartshell FROM application_smartshell;

-- User and Privileges
CREATE USER luis122448 WITH PASSWORD '1073741824' LOGIN;
CREATE USER user_smartshell WITH PASSWORD '1073741824' LOGIN;

-- ALTER USER luis122448 WITH PASSWORD '1073741824';
-- ALTER USER user_smartshell WITH PASSWORD '1073741824';
-- DROP USER luis122448;
-- DROP USER user_smartshell;

-- List user
-- SELECT * FROM pg_user;

-- Current user
-- SELECT * FROM current_user;
-- SELECT * FROM session_user;

-- Assign role
GRANT developer TO luis122448;
GRANT application_smartshell TO user_smartshell;

-- Remove role
-- REVOKE developer FROM luis122448;
-- REVOKE user_smartshell FROM application_smartshell;

-- How do i get a list og users by role?
SELECT
  r.rolname AS role_name,
  u.usename AS user_name
FROM
  pg_roles r
LEFT JOIN pg_auth_members m ON r.oid = m.roleid
LEFT JOIN pg_user u ON m.member = u.usesysid
WHERE
	r.rolname IN ('postgres','developer','application_smartshell')
ORDER BY
  r.rolname, u.usename;

-- Schema
CREATE SCHEMA SMARTSHELL;
-- DROP SCHEMA SMARTSHELL;

-- User schema default
ALTER ROLE postgres SET search_path = public;
ALTER ROLE application_smartshell SET search_path = SMARTSHELL, public;

-- List schema exists
SELECT schema_name FROM information_schema.schemata;

-- Change schema
SET search_path TO public;

-- Temporary schema
BEGIN;
	SET LOCAL search_path TO SMARTSHELL;
	-- SELECT ...
	RESET search_path;
COMMIT;

-- Current schema
SELECT current_schema();

SET search_path TO "$user", public;
SELECT current_schema();

-- Tablespace
CREATE TABLESPACE luis122448
	OWNER
	LOCATION

-- List of tablespace
SELECT * FROM pg_tablespace;

-- Path
SELECT ts.spclocation AS tablespace_location
FROM pg_tablespace ts
JOIN pg_stat_all_tables st ON ts.oid = st.reltablespace
WHERE st.relname = 'pg_default';


SELECT ts.spcname AS current_tablespace
FROM pg_tablespace ts
INNER JOIN pg_class c ON ts.oid = c.reltablespace
WHERE c.relname = 'tbl_usuario';

-- Pg class
SELECT * FROM pg_class WHERE relname = 'tbl_usuario';