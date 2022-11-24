-- root
USE PracABD1;

-- Role creation:
CREATE ROLE gestor;
-- Grant privileges:
GRANT SELECT, INSERT, UPDATE, DELETE ON PracABD1.* TO gestor WITH GRANT OPTION;
GRANT CREATE ROLE, CREATE USER, DROP ROLE ON *.* TO gestor WITH GRANT OPTION;
GRANT ROLE_ADMIN ON *.* TO gestor WITH GRANT OPTION;
-- See role:
SELECT CURRENT_ROLE();
-- See user:
SELECT CURRENT_USER();
-- See GRANTS:
SHOW GRANTS FOR root@localhost;
-- Create user:
CREATE USER gohan;
-- Assign role to the user:
GRANT gestor TO gohan;
-- Activate role:
SET DEFAULT ROLE gestor TO gohan;