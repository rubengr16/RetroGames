-- Convert the excel into a CSV with TABs as separator. 
-- Create an auxiliary table to store the data read from the converted file.
CREATE TABLE IF NOT EXISTS ClientesFromCSV (
	ClienteIDCSV		INTEGER,
    DNICSV				VARCHAR(9)	UNIQUE NOT NULL,
    NombreCSV			VARCHAR(20)	NOT NULL,
    ApellidosCSV		VARCHAR(30)	NOT NULL,
    GeneroCSV			ENUM('H', 'M'),
    DireccionCSV		VARCHAR(60),
    LocalidadCSV		VARCHAR(50),
    ProvinciaCSV		VARCHAR(30),
    CodPostalCSV		INTEGER,
    TelefonoCSV			VARCHAR(9),
    CanalCSV			ENUM('0', '1', '2', '3', '4'),
    FechaNacimientoCSV	VARCHAR(10),
    FechaContactoCSV	VARCHAR(10),
    EmailCSV			VARCHAR(60)
    )	;

-- Later, with the import wizard select the converted file
-- and insert the data into an auxiliary Table. Ensure that most of the data is in text and int format, so later
-- you could manipulate this stream.
--
-- A faster option is:
-- LOAD DATA LOCAL INFILE '//tsclient/home/Desktop/RetroGames/DATOS/Clientes.csv'
-- INTO TABLE clientesfromcsv
-- CHARACTER SET latin1
-- FIELDS TERMINATED BY '\t'
-- LINES TERMINATED BY '\n';
INSERT INTO Clientes (ClienteID, DNI, Nombre, Apellidos, Genero, Direccion, 
					  Localidad, Provincia, CodPostal, Telefono, Canal, Email)
SELECT ClienteIDCSV, DNICSV, NombreCSV, ApellidosCSV, GeneroCSV, DireccionCSV, 
	   LocalidadCSV, ProvinciaCSV, CodPostalCSV, TelefonoCSV, CanalCSV, EmailCSV
FROM ClientesFromCSV
ORDER BY ClienteIDCSV ASC;


UPDATE Clientes
SET FechaNacimiento = STR_TO_DATE(ClientesFromCSV.FechaNacimientoCSV, '%d/%m/%Y')	;

UPDATE Clientes
SET FechaContacto = STR_TO_DATE(ClientesFromCSV.FechaContactoCSV, '%d/%m/%Y')	;

-- UPDATE ;

 

SELECT COUNT(*)
FROM ClientesFromCSV;

-- SELECT *
-- FROM Clientes;
 DROP TABLE clientesfromcsv;