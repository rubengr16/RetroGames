-- OPTION 1: Using MySQL WB
-- Backup
-- Server > Data Export
-- Select desired Schema, choose Export to Self-Contained File and select file name
-- [, check Dump Stored Procedures and Funcions and check Include Create Schema]
-- Start export

-- Recovery
-- Server > Data Import
-- Choose Import to Self-Contained File and select file[, check that it is selected Dump Structure and Data]
-- Start import

-- OPTION 2: Terminal
-- Backup
-- Go to MySQL/bin, open a terminal and execute:
-- mysqldump -u root -p pracabd1 > <path to>\recovery_<date>.sql
-- Modify recovery_<date>.sql by adding to the beginning:
-- CREATE DATABASE  IF NOT EXISTS `recovery_<date>` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
-- USE `recovery_<date>`;

-- Recovery
-- Go to MySQL/bin, open a terminal and execute:
-- login using mysql -u root -p
-- Later, execute the following statements:
-- CREATE DATABASE recovery_<date>;
-- Check the creation of the database:
-- SHOW DATABASES;
-- Exit and execute
-- mysql -u root -p recovery_<date> < <path to>\recovery_<date>.sql

