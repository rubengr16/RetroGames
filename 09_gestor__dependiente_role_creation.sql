-- gestor - gohan
-- Create new connection if not exists already, setting the proper user
-- Log with the connection
-- Create user:
CREATE ROLE dependiente;
-- Grant privilege:
GRANT SELECT ON PracABD1.* TO dependiente;
GRANT INSERT, UPDATE ON PracABD1.Clientes TO dependiente;
GRANT INSERT ON PracABD1.Clientes_Juegos TO dependiente;

-- Create users:
CREATE USER trunks, goku;
-- Assign role to the users:
GRANT dependiente TO trunks, goku;
-- Activate roles:
SET DEFAULT ROLE dependiente TO trunks, goku;