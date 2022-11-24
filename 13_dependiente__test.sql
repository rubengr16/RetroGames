-- dependiente - trunks or goku
USE PracABD1;
-- Correct queries:
-- 1.
SELECT *
FROM Juegos;
-- 2.
INSERT INTO Clientes_Juegos(ClienteID, JuegoID, FechaAlquiler, Comentarios)
VALUES ('666', '10666', '2022-11-24', 'I liked the game a lot!! Thanks');

-- Forbidden queries:
-- 1.
CREATE TABLESPACE TBLS_NewTablespace ADD DATAFILE 'DF_NewDatafile.ibd';
-- 2.
CREATE TABLE IF NOT EXISTS NewTable (
	BadID	INTEGER		NOT NULL,
    Field		INTEGER		NOT	NULL
    );
-- 3.
INSERT INTO Juegos(JuegoID, Titulo, Consola, Tamanio, Editor)
VALUES ('666666', 'ADB Game', 'MyComputer', '666', 'MyTeacher');