-- Create new connection if not exists already, setting the proper user
-- Log with the connection
-- Create user:
CREATE ROLE compradorJuegos;
-- Grant privilege:
GRANT SELECT ON PracABD1.* TO compradorJuegos;
GRANT INSERT ON PracABD1.Juegos TO compradorJuegos;
