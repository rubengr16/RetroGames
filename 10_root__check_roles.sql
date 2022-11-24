-- root
-- OPTION 1: Using queries:
-- See DBs;
SHOW DATABASES;
-- Use information_schema which is the one which has the catalog:
USE information_schema;
-- See tables:
SHOW TABLES;
-- See user privileges:
-- WARNING: The catalog may not be updated and show outdated privilege types:
SELECT *
FROM USER_PRIVILEGES;

-- OPTION 2: SHOW GRANTS FOR:
-- gestor role and gohan user:
SHOW GRANTS FOR gestor;
SHOW GRANTS FOR gohan;
-- compradorJuegos role and Vegeta and Bidel users:
SHOW GRANTS FOR compradoJuegos;
SHOW GRANTS FOR vegeta;
SHOW GRANTS FOR bidel;
-- dependiente role and Trunks and Goku:
SHOW GRANTS FOR dependiente;
SHOW GRANTS FOR trunks;
SHOW GRANTS FOR goku;