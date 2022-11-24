-- gestor - gohan
USE PracABD1;
-- Correct queries:
-- 1.
CREATE ROLE newRole;
-- 2.
INSERT INTO Clientes(ClienteID, DNI, Nombre, Apellidos, Genero, Direccion, Localidad, Provincia, CodPostal, Telefono, Canal, FechaNacimiento, FechaContacto, Email)
VALUES ('666666', '666666R', 'Ruben', 'Gallego', 'H', 'Calle Informatica', 'Madrid', 'Madrid', 66666, '666666666', '0', '2001-12-16', '2001-12-12', 'ruben16gallego@gmail.com');
SELECT *
FROM Clientes;
-- Forbidden queries:
-- 1.
CREATE TABLESPACE TBLS_NewTablespace ADD DATAFILE 'DF_NewDatafile.ibd';
-- 2.
CREATE TABLE IF NOT EXISTS NewTable (
	BadID	INTEGER		NOT NULL,
    Field		INTEGER		NOT	NULL
    );
