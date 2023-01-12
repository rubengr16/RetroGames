-- root
USE PracABD1;

-- Create view for Clientes with the needed columns:
CREATE VIEW viewEssentialClientes
	AS SELECT ClienteID, Nombre, Apellidos, Provincia, Email
    FROM Clientes;

CREATE VIEW viewEssentialJuegos
	AS SELECT JuegoID, Titulo, Tamanio, Editor
    FROM Juegos
    WHERE Consola = 'GameBoy';

-- Due to the insertion problems in INSERT queries of freezer -18_freezer__queries-:
-- OPTION 1: With special procedure for data insertion
DELIMITER $$
CREATE PROCEDURE INSERT_Clientes_FREEZER(ClienteID INTEGER, Nombre VARCHAR(20), Apellidos VARCHAR(30), Email VARCHAR(60))
BEGIN
	DECLARE DNInvented INTEGER;
    
	IF USER() <> 'freezer@localhost' THEN
		SIGNAL SQLSTATE '11111'
		SET MESSAGE_TEXT = 'Denied, you are not the user allowed to execute this action', MYSQL_ERRNO = 11111;
    ELSEIF LOCATE("'", Nombre) OR LOCATE("'", Apellidos) OR LOCATE('"', Email) OR LOCATE('"', Nombre) OR LOCATE('"', Apellidos)OR LOCATE('"', Email)  THEN
		SIGNAL SQLSTATE '22222'
		SET MESSAGE_TEXT = 'Denied, do not try to do SQL Injection', MYSQL_ERRNO = 22222;
    END IF;
    SET @DNInvented = (SELECT MAX(CAST(DNI AS SIGNED) + 1)
				FROM Clientes
				WHERE LEFT(DNI, 1) = '-');
	IF @DNInvented IS NULL THEN
		SET @DNInvented = -99999999;
	END IF;
	INSERT INTO Clientes(ClienteID, DNI, Nombre, Apellidos, Email)
	VALUES (ClienteID, @DNInvented, Nombre, Apellidos, Email);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE INSERT_Juegos_FREEZER(JuegoID INTEGER, Titulo VARCHAR(128), Tamanio INTEGER, Editor VARCHAR(32))
BEGIN
	IF USER() <> 'freezer@localhost' THEN
		SIGNAL SQLSTATE '33333'
		SET MESSAGE_TEXT = 'Denied, you are not the user allowed to execute this action', MYSQL_ERRNO = 33333;
    ELSEIF LOCATE("'", Titulo) OR LOCATE("'", Editor) OR LOCATE('"', Titulo) OR LOCATE('"', Editor) THEN
		SIGNAL SQLSTATE '44444'
		SET MESSAGE_TEXT = 'Denied, do not try to do SQL Injection', MYSQL_ERRNO = 44444;
    END IF;
	INSERT INTO Juegos(JuegoID, Titulo, Consola, Tamanio, Editor)
	VALUES (JuegoID, Titulo, 'GameBoy', Tamanio, Editor);
END $$
DELIMITER ;

-- OPTION 2: With trigger before insert
DELIMITER $$
CREATE TRIGGER BEFORE_INSERT_Clientes BEFORE INSERT ON Clientes
FOR EACH ROW
BEGIN
	IF USER() <> 'freezer@localhost' THEN
		SIGNAL SQLSTATE '55555'
		SET MESSAGE_TEXT = 'Denied, you are not the user allowed to execute this action', MYSQL_ERRNO = 55555;
    END IF;
    SET NEW.DNI = (SELECT MAX(CAST(DNI AS SIGNED) + 1)
				FROM Clientes
				WHERE LEFT(DNI, 1) = '-');
	IF NEW.DNI  IS NULL THEN
		SET NEW.DNI = -99999999;
	END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER BEFORE_INSERT_Juegos BEFORE INSERT ON Juegos
FOR EACH ROW
BEGIN
	IF USER() <> 'freezer@localhost' THEN
		SIGNAL SQLSTATE '66666'
		SET MESSAGE_TEXT = 'Denied, you are not the user allowed to execute this action', MYSQL_ERRNO = 66666;
	END IF;
	SET NEW.Consola = 'GameBoy';
END $$
DELIMITER ;