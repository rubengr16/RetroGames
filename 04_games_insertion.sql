-- PREVIOUSLY ON AGBD: through cmd write:
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

-- And, now, the IMPORTANT:
-- To avoid title truncation, change the VARCHAR(<size>):
-- ALTER TABLE <table_name> MODIFY <col_name> <new_type>;
-- ALTER TABLE Juegos MODIFY Titulo VARCHAR(18);

-- To set values of ID with AUTO_INCREMENT.
-- NOTE: maybe it is necessary to DROP and CREATE TABLE with the correct configurations:
-- ALTER TABLE <table_name> AUTO_INCREMENT = <value>;

-- -> LOAD XML LOCAL INFILE '<file_name>'
-- -> INTO TABLE <table_name>
-- -> ROWS IDENTIFIED BY '<<entity_xml_tag>>'
-- -> (@<atribute_xml_subtag1>[, @<atribute_xml_subtag2> ...])
-- -> SET <column_name1> = @<atribute_xml_subtag1>[,
-- -> ...,
-- -> MODIFICATIONS OF @<atribute_xml_subtagn> COULD BE MADE HERE,
-- -> ...;

ALTER TABLE Juegos AUTO_INCREMENT = 10000;
-- -> LOAD XML LOCAL INFILE '//tsclient/E/Uni/ABD/RetroGames/DATOS/MegaDrive.xml'
-- -> INTO TABLE Juegos
-- -> ROWS IDENTIFIED BY '<game>'
-- -> (@title, @romSize, @publisher)
-- -> SET Titulo = @title,
-- -> Consola = 'MegaDrive',
-- -> Tamanio = @romSize,
-- -> Editor = @publisher;

ALTER TABLE Juegos AUTO_INCREMENT = 12000;
-- -> LOAD XML LOCAL INFILE '//tsclient/E/Uni/ABD/RetroGames/DATOS/Nintendo.xml'
-- -> INTO TABLE Juegos
-- -> ROWS IDENTIFIED BY '<game>'
-- -> (@title, @romSize, @publisher)
-- -> SET Titulo = @title,
-- -> Consola = 'Nintendo',
-- -> Tamanio = @romSize,
-- -> Editor = @publisher;

ALTER TABLE Juegos AUTO_INCREMENT = 15000;
-- -> LOAD XML LOCAL INFILE '//tsclient/E/Uni/ABD/RetroGames/DATOS/GameBoy.xml'
-- -> INTO TABLE Juegos
-- -> ROWS IDENTIFIED BY '<game>'
-- -> (@title, @romSize, @publisher)
-- -> SET Titulo = @title,
-- -> Consola = 'GameBoy',
-- -> Tamanio = @romSize,
-- -> Editor = @publisher;


