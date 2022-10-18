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
-- -> LOAD XML LOCAL INFILE '<file_name>'
-- -> INTO TABLE <table_name>
-- -> ROWS IDENTIFIED BY '<<entity_xml_tag>>'
-- -> (@<atribute_xml_subtag1>[, @<atribute_xml_subtag2> ...])
-- -> SET <column_name1> = @<atribute_xml_subtag1>[,
-- -> ...,
-- -> MODIFICATIONS OF @<atribute_xml_subtagn> COULD BE MADE HERE,
-- -> ...;

-- -> LOAD XML LOCAL INFILE '//tsclient/E/Uni/ABD/RetroGames/DATOS/MegaDrive.xml'
-- -> INTO TABLE Juegos
-- -> ROWS IDENTIFIED BY '<game>'
-- -> (@imageNumber, @title, @romSize, @publisher)
-- -> SET JuegoID = @imageNumber + 9999,
-- -> Titulo = @title,
-- -> Consola = 'MegaDrive',
-- -> Tamanio = @romSize,
-- -> Editor = @publisher;

-- -> LOAD XML LOCAL INFILE '//tsclient/E/Uni/ABD/RetroGames/DATOS/Nintendo.xml'
-- -> INTO TABLE Juegos
-- -> ROWS IDENTIFIED BY '<game>'
-- -> (@imageNumber, @title, @romSize, @publisher)
-- -> SET JuegoID = @imageNumber + 11999,
-- -> Titulo = @title,
-- -> Consola = 'Nintendo',
-- -> Tamanio = @romSize,
-- -> Editor = @publisher;

-- -> LOAD XML LOCAL INFILE '//tsclient/E/Uni/ABD/RetroGames/DATOS/GameBoy.xml'
-- -> INTO TABLE Juegos
-- -> ROWS IDENTIFIED BY '<game>'
-- -> (@imageNumber, @title, @romSize, @publisher)
-- -> SET JuegoID = @imageNumber + 14999,
-- -> Titulo = @title,
-- -> Consola = 'GameBoy',
-- -> Tamanio = @romSize,
-- -> Editor = @publisher;


