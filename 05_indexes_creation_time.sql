--                    +------------+-------------------+----------+-----------+---------+
--                    |  Clientes  |  Clientes_Juegos  |  Juegos  +  Indices  |  Total  |
-- +------------------+------------+-------------------+----------+-----------+---------+
-- |  Upload-Indexes  |    7.06    |       2.25        |   3.73   |   1.828   |  14.868 |
-- +------------------+------------+-------------------+----------+-----------+---------+
-- |  Indexes-Upload  |    6.63    |       2.79        |   2.42   |   0.141   +  11.981 |
-- +------------------+------------+-------------------+----------+-----------+---------+

-- If indexes are created previously, the rows where Clientes_Juegos.JuegosID isn't in Juegos.JuegosID,
-- those rows are skipped. Otherwise, when creating the indexes an error will be risen.
