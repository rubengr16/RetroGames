USE PracABD1;

CREATE TABLE IF NOT EXISTS Clientes (
	ClienteID	INTEGER		UNIQUE NOT NULL,
    DNI			VARCHAR(9)	UNIQUE NOT NULL,
    Nombre		VARCHAR(20)	NOT NULL,
    Apellidos	VARCHAR(30)	NOT NULL,
    Genero		ENUM('H', 'M'),
    Direccion	VARCHAR(60),
    Localidad	VARCHAR(50),
    Provincia	VARCHAR(30),
    CodPostal	INTEGER,
    Telefono	VARCHAR(9),
    Canal		ENUM('0', '1', '2', '3', '4'),
    FechaNacimiento	DATE,
    FechaContacto	DATE,
    Email		VARCHAR(60)
    )	TABLESPACE TBLS_Clientes;
    
CREATE TABLE IF NOT EXISTS Juegos (
	JuegoID		INTEGER		UNIQUE	NOT NULL,
    Titulo		VARCHAR(32)	UNIQUE	NOT NULL,
    Consola		VARCHAR(12)	NOT NULL,
    Tamanio		INTEGER,
    Editor		VARCHAR(32)
	)	TABLESPACE TBLS_Juegos;
    
CREATE TABLE IF NOT EXISTS Clientes_Juegos (
	ClienteID	INTEGER		NOT NULL,
    JuegoID		INTEGER		NOT	NULL,
    FechaAlquiler	DATE	NOT NULL,
    Comentarios	VARCHAR(500)
    )	TABLESPACE TBLS_Clientes_Juegos;
