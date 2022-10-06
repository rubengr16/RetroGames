USE PracABD1;

-- For an InnoDB tablespace, all tables must be dropped from the tablespace prior to a DROP TABLESPACE operation. 
-- If the tablespace is not empty, DROP TABLESPACE returns an error.
DROP TABLESPACE TBLS_Clientes;
DROP TABLESPACE TBLS_Juegos;
DROP TABLESPACE TBLS_Clientes_Juegos;

-- As with the InnoDB system tablespace, truncating or dropping InnoDB tables stored in a general tablespace creates free 
-- space in the tablespace .ibd data file, which can only be used for new InnoDB data. Space is not released back to the
-- operating system by such operations as it is for file-per-table tablespaces.

-- Tablespaces are not deleted automatically. A tablespace must be dropped explicitly using DROP TABLESPACE. DROP DATABASE 
-- has no effect in this regard, even if the operation drops all tables belonging to the tablespace.