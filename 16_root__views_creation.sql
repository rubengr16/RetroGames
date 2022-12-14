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
SELECT USER();
DELIMITER $$
CREATE TRIGGER SetFreezerConsola4 BEFORE INSERT ON Juegos
FOR EACH ROW
BEGIN
	IF (SELECT USER()) = 'freezer@localhost' THEN
		UPDATE Juegos
		SET Consola = 'GameBoy'
        WHERE JuegoID = NEW.JuegoID;
	END IF;
END; $$
DELIMITER ;
SHOW FULL TABLES IN pracabd1 WHERE TABLE_TYPE LIKE 'VIEW';
