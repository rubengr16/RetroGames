-- compradorJuego - Vegeta or Bidel
USE PracABD1;
-- Correct queries:
-- 1.
SELECT *
FROM Juegos;
-- 2.
INSERT INTO Juegos(JuegoID, Titulo, Consola, Tamanio, Editor)
VALUES ('666666', 'ADB Game', 'MyComputer', '666', 'MyTeacher');

-- Forbidden queries:
-- 1.
CREATE TABLESPACE TBLS_NewTablespace ADD DATAFILE 'DF_NewDatafile.ibd';
-- 2.
CREATE TABLE IF NOT EXISTS NewTable (
	BadID	INTEGER		NOT NULL,
    Field		INTEGER		NOT	NULL
    );
-- 3.
INSERT INTO Clientes(ClienteID, DNI, Nombre, Apellidos, Genero, Direccion, Localidad, Provincia, CodPostal, Telefono, Canal, FechaNacimiento, FechaContacto, Email)
VALUES ('666666', '666666R', 'Ruben', 'Gallego', 'H', 'Calle Informatica', 'Madrid', 'Madrid', 66666, '666666666', '0', '2001-12-16', '2001-12-16', 'ruben16gallego@gmail.com');
