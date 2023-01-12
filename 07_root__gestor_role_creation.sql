-- root
USE PracABD1;

-- Role creation:
CREATE ROLE gestor;
-- Grant privileges:
-- DML -Data Modification Language- operations are SELECT, INSERT, UPDATE and DELETE
-- DDL -Data Definition Language- operations are CREATE, ALTER and DROP
GRANT SELECT, INSERT, UPDATE, DELETE ON PracABD1.* TO gestor WITH GRANT OPTION;
GRANT CREATE ROLE, CREATE USER, DROP ROLE ON *.* TO gestor WITH GRANT OPTION;
-- Enable roles to be granted or revoked, use of WITH ADMIN OPTION. Level: Global
GRANT ROLE_ADMIN ON *.* TO gestor WITH GRANT OPTION;

-- Create user:
CREATE USER gohan;
-- Assign role to the user:
GRANT gestor TO gohan;
-- Activate role:
SET DEFAULT ROLE gestor TO gohan;

-- EXTRA!! Useful statements
-- See role:
SELECT CURRENT_ROLE();
-- See user:
SELECT CURRENT_USER();
-- See GRANTS:
SHOW GRANTS FOR root@localhost;
-- See users in the DB:
SELECT user, host FROM mysql.user;