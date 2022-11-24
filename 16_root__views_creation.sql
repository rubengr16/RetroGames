-- root
USE PracABD1;

-- Create view for Clientes with the needed columns:
CREATE VIEW viewEssentialClientes
	AS SELECT ClienteID, Nombre, Apellidos, Provincia, Email
    FROM Clientes;

CREATE VIEW ViewEssentialJuegos
	AS SELECT JuegoID, Titulo, Tamanio, Editor
    FROM Juegos
    WHERE Consola = 'GameBoy';