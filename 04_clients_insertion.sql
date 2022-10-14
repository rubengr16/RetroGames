-- ALWAYS: Convert the excel into a CSV with TABs as separator. 
-- OPTION 1: Create an auxiliary table to store the data read from the converted file.
-- Later, with the import wizard select the converted file
-- and insert the data into an auxiliary Table. Ensure that most of the data is in text and int format, so later
-- you could manipulate this stream.
--
-- OPTION2: A faster option is through cmd write:
-- > mysql -u root -p --local-infile=1
-- Move to the desired database (in case of doubt use: $SHOW DATABASES;):
-- -> USE <database_name>;
-- In case of need use: $ SHOW TABLES;
-- Ensure that local_infile is enabled by:
-- -> SHOW GLOBAL VARIABLES LIKE 'local_infile';
-- If it is in OFF, set it ON:
-- -> SET GLOBAL local_infile=1;
-- And later:
-- -> LOAD DATA LOCAL INFILE '<file_name>'
-- -> INTO TABLE <table_name>
-- -> CHARACTER SET latin1
-- -> FIELDS TERMINATED BY '\t'
-- -> LINES TERMINATED BY '\n'
-- ->(ClienteID, DNI, Nombre, Apellidos, Genero, Direccion, Localidad, Provincia, CodPostal, Telefono, Canal, @FechaNacimientoProv, @FechaContactoProv, @EmailProv)
-- -> SET FechaNacimiento = STR_TO_DATE(@FechaNacimientoProv, '%d/%m/%Y'),
-- -> FechaContacto = STR_TO_DATE(@FechaContactoProv, '%d/%m/%Y');



 

SELECT COUNT(*)
FROM ClientesFromCSV;
USE PracABD1;
SELECT REPLACE(Clientes.Email, 'í', 'i');
SELECT *
FROM Clientes;
DROP TABLE clientes;