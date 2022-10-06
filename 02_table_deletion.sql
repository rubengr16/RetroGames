USE PracABD1;

-- As Clientes_Juegos references foreign keys of Clientes and Juegos it must be the first to be deleted.
DROP TABLE Clientes_Juegos;
DROP TABLE Clientes;
DROP TABLE Juegos;

