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
-- Select database:
-- USE <database_name>;
-- And later:
-- -> LOAD DATA LOCAL INFILE '<file_name>'
-- -> INTO TABLE <table_name>
-- -> CHARACTER SET latin1
-- -> FIELDS TERMINATED BY '\t'
-- -> LINES TERMINATED BY '\n'
-- ->(<column_name1>[, <column_name2>, [<prov_var1>] ...])
-- -> SET <column_name1> = <prov_var1>[,
-- -> ...,
-- -> MODIFICATIONS OF <prov_varn> COULD BE MADE HERE,
-- -> ...];

-- -> LOAD DATA LOCAL INFILE '//tsclient/E/Uni/ABD/RetroGames/DATOS/Clientes.csv'
-- -> INTO TABLE Clientes
-- -> CHARACTER SET latin1
-- -> FIELDS TERMINATED BY '\t'
-- -> LINES TERMINATED BY '\n'
-- -> (ClienteID, DNI, Nombre, Apellidos, Genero, Direccion, Localidad, Provincia, CodPostal, Telefono, Canal, @FechaNacimientoProv, @FechaContactoProv, Email)
-- -> SET FechaNacimiento = STR_TO_DATE(@FechaNacimientoProv, '%d/%m/%Y'),
-- -> FechaContacto = STR_TO_DATE(@FechaContactoProv, '%d/%m/%Y');

-- Creation of a Procedure with a Cursor which deletes accents and ñ:
DELIMITER $$
CREATE PROCEDURE REPLACE_SPANISH()
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE id INT;
    DECLARE mail VARCHAR(60);
	DECLARE cur CURSOR FOR SELECT ClienteID, Email FROM Clientes; -- Creación
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	OPEN cur; -- Apertura
	read_loop: LOOP
		FETCH cur INTO id, mail;
		SET mail = REPLACE(mail, 'á', 'a');
        SET mail = REPLACE(mail, 'é', 'e');
        SET mail = REPLACE(mail, 'í', 'i');
        SET mail = REPLACE(mail, 'ó', 'o');
        SET mail = REPLACE(mail, 'ú', 'u');
        SET mail = REPLACE(mail, 'ñ', 'n');
		SET mail = REPLACE(mail, 'Á', 'A');
        SET mail = REPLACE(mail, 'É', 'E');
        SET mail = REPLACE(mail, 'Í', 'I');
        SET mail = REPLACE(mail, 'Ó', 'O');
        SET mail = REPLACE(mail, 'Ú', 'U');
        SET mail = REPLACE(mail, 'Ñ', 'N');
		UPDATE Clientes
        SET Email = mail
        WHERE Clientes.ClienteID = id;
		IF done THEN
			LEAVE read_loop;
		END IF;
	END LOOP;
	CLOSE cur; -- Cierre
END$$
DELIMITER ;

-- Procedure execution:
-- DISCLAIMER: In case of time-out: Edit > Preferences... > SQL Editor 
-- and Modify the interval values to 0, 0, 600000.
CALL REPLACE_SPANISH();

-- DROP PROCEDURE REPLACE_SPANISH;