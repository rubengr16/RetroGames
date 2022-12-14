-- root
-- Create user:
CREATE USER freezer;
-- Grant privileges on views:
GRANT SELECT, INSERT ON PracABD1.viewEssentialClientes TO freezer WITH GRANT OPTION;
GRANT SELECT, INSERT ON PracABD1.viewEssentialJuegos TO freezer WITH GRANT OPTION;
