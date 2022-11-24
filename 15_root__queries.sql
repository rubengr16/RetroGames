-- root
USE PracABD1;
-- A.
-- A1. Obtener nombres y apellidos de clientes ordenados por provincia - 0s:
SELECT Nombre, Apellidos
FROM Clientes;

-- A2. Obtener el número de clientes de Sevilla - 0.047s:
SELECT COUNT(*)
FROM Clientes
WHERE Provincia = 'SEVILLA';

-- A3. Obtener el email de los clientes de Barcelona - 0.062s:
SELECT Email
FROM Clientes
WHERE Provincia = 'BARCELONA';

-- A4. Insertar nuevos clientes - 0.016s:
INSERT INTO Clientes(ClienteID, DNI, Nombre, Apellidos, Genero, Direccion, Localidad, Provincia, CodPostal, Telefono, Canal, FechaNacimiento, FechaContacto, Email)
VALUES ('999999', '999999R', 'Dani', 'Profe', 'H', 'Calle Despacho', 'Madrid', 'Madrid', 66666, '666666666', '0', '1973-01-29', '1987-11-18', 'dani@gmail.com');

-- B.
-- B1. Obtener la información de los videojuegos ordenados por tamaño - 0.016s:
SELECT *
FROM Juegos
WHERE Consola = 'GameBoy'
ORDER BY Tamanio;

-- B2. Obtener el número de videojuegos editados por Nintendo - 0.016s:
SELECT *
FROM Juegos
WHERE Consola = 'GameBoy' AND
	Editor = 'Nintendo'
ORDER BY Tamanio;

-- B3. Insertar nuevos videojuegos de GameBoy
INSERT INTO Juegos(JuegoID, Titulo, Consola, Tamanio, Editor)
VALUES ('444444', 'ROOT Game', 'GameBoy', '444', 'MyRoot');