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
-- And later:
-- -> LOAD DATA LOCAL INFILE '<file_name>'
-- -> INTO TABLE <table_name>
-- -> CHARACTER SET latin1
-- -> FIELDS TERMINATED BY '\t'
-- -> LINES TERMINATED BY '\n'
-- -> (<column_name1>[, <column_name2>, [<prov_var1>] ...])
-- -> [SET <column_name1> = <prov_var1>,
-- -> ...,
-- -> MODIFICATIONS OF <prov_varn> COULD BE MADE HERE,
-- -> ...];

-- And, now, the IMPORTANT:
-- -> LOAD DATA LOCAL INFILE '//tsclient/E/Uni/ABD/RetroGames/DATOS/Clientes_Juegos.csv'
-- -> INTO TABLE Clientes_Juegos
-- -> CHARACTER SET latin1
-- -> FIELDS TERMINATED BY '\t'
-- -> LINES TERMINATED BY '\n'
-- -> (ClienteID, JuegoID, @FechaAlquilerProv, Comentarios)
-- -> SET FechaAlquiler = STR_TO_DATE(@FechaAlquilerProv, '%d/%m/%Y');

-- ATENTION: to detect ghost rows, we can use the following query:
SELECT DISTINCT(JuegoID)
FROM Clientes_Juegos
WHERE JuegoID NOT IN (SELECT JuegoID
                      FROM Juegos);

-- Ghost rows deletion:
-- DELETE FROM Clientes_Juegos
-- WHERE JuegoID = 14105;