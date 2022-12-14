-- root
USE PracABD1;
-- A.
-- A1. Obtener nombres y apellidos de clientes ordenados por provincia - 0.015s:
SELECT Nombre, Apellidos
FROM viewEssentialClientes;

-- A2. Obtener el número de clientes de Sevilla - 0.125s:
SELECT COUNT(*)
FROM viewEssentialClientes
WHERE Provincia = 'SEVILLA';

-- A3. Obtener el email de los clientes de Barcelona - 0.110s:
SELECT Email
FROM viewEssentialClientes
WHERE Provincia = 'BARCELONA';

-- A4. Insertar nuevos clientes - FAIL: Error Code: 1423. Field of view 'pracabd1.viewessentialclientes' 
-- underlying table doesn't have a default value:
INSERT INTO viewEssentialClientes(ClienteID, Nombre, Apellidos, Email)
VALUES ('9999997', 'Freezer', 'New', 'freezer@gmail.com');

-- B.
-- B1. Obtener la información de los videojuegos ordenados por tamaño - 0.000s:
SELECT *
FROM viewEssentialJuegos
ORDER BY Tamanio;

-- B2. Obtener el número de videojuegos editados por Nintendo - 0.000s:
SELECT *
FROM viewEssentialJuegos
WHERE Editor = 'Nintendo'
ORDER BY Tamanio;

-- B3. Insertar nuevos videojuegos de GameBoy: FAIL: Consola can't be accessed by freezer:
INSERT INTO viewEssentialJuegos(JuegoID, Titulo, Tamanio, Editor)
VALUES ('444445', 'FREEZER Game', '445', 'MyFreezer');