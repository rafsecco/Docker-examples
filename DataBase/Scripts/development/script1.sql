-- SQL Server, MySQL/MariaDB, PostgreSQL, Oracle
CREATE TABLE users (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE
);

-- Para garantir que o id seja auto-incrementado em cada banco de dados
-- SQL Server:
-- Para criar uma coluna auto-increment em SQL Server
-- Alteração: Para SQL Server, use "IDENTITY"

-- MySQL/MariaDB:
-- Para MySQL/MariaDB, use "AUTO_INCREMENT"

-- PostgreSQL:
-- Para PostgreSQL, use "SERIAL"

-- Oracle:
-- Para Oracle, use "SEQUENCE" e "TRIGGER"

INSERT INTO users (id, name, email) VALUES (1, 'John Doe', 'john@example.com');

-- CREATE TABLE users (
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   name VARCHAR(100),
--   email VARCHAR(100) UNIQUE
-- );
