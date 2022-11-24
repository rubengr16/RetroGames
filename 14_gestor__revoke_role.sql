-- gestor - gohan
-- Revoke previous role:
REVOKE dependiente FROM goku;
-- Create user:
CREATE ROLE torpe;
-- Grant privilege:
GRANT SELECT ON PracABD1.* TO goku;
-- Assign role to the users:
GRANT torpe TO goku;
-- Activate roles:
SET DEFAULT ROLE torpe TO goku;