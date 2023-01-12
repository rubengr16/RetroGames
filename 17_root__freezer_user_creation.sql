-- root
-- Create user:
CREATE USER freezer;
-- Grant privileges on views:
GRANT SELECT, INSERT ON PracABD1.viewEssentialClientes TO freezer;
GRANT SELECT, INSERT ON PracABD1.viewEssentialJuegos TO freezer;
-- OPTION 1: Grant privileges on procedure to insert as freezer:
GRANT EXECUTE ON PROCEDURE PracABD1.INSERT_Juegos_FREEZER TO freezer;
GRANT EXECUTE ON PROCEDURE PracABD1.INSERT_Clientes_FREEZER TO freezer;
