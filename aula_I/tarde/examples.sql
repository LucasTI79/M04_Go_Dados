-- CRIANDO BANCO DE DADOS CASO NÃO EXISTA

CREATE DATABASE IF NOT EXISTS meli_data;
USE meli_data;

-- -------------------------------
-- EXEMPLO TABELA
-- -------------------------------

-- CRIANDO TABELA 'products'
DROP TABLE IF EXISTS products;
CREATE TABLE products(
  -- como se fosse o IDENTITY do MSSQL
	id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  count INT DEFAULT 0
);

-- MANIPULANDO DADOS (DML)

-- INSERT ALL VALUES

INSERT INTO products VALUES (NULL, 'BATATA', 5.00, 5);

-- INSERT SOME VALUES VALUES

INSERT INTO products(name, price, count) VALUES ('CENOURA', 2.00, 10);
INSERT INTO products(name, price, count) VALUES ('CHUCHU', 1.00, 20);
INSERT INTO products(name, price, count) VALUES ('ABÓBORA', 4.00, 30);
INSERT INTO products(name, price, count) VALUES ('MANDIOQUINHA', 10.00, 40);

-- SELECT

SELECT * FROM products; 

-- SELECT WITH ORDER BY

SELECT * FROM products ORDER BY price ASC; 

-- SELECT WITH WHERE

SELECT * FROM products WHERE price >= 4

-- SELECT WITH WHERE & AND

SELECT * FROM products WHERE price >= 4 AND `count` > 35; 

-- SELECT WITH WHERE & OR

SELECT * FROM products WHERE price >= 4 OR `count` > 35; 

-- SELECT WITH LIKE (como se fosse uma regex)

-- Termina com 'a'
SELECT * FROM products WHERE name LIKE '%a';

-- Começa com 'a'
SELECT * FROM products WHERE name LIKE 'a%';

-- Tem a letra 'a'
SELECT * FROM products WHERE name LIKE '%a%';

-- SELECT WITH BETWEEN

SELECT * FROM products WHERE `count` BETWEEN 10 AND 20; 

-- LIMIT AND OFFSET (paginação)

-- Comparável ao TOP do MSSQL
SELECT * FROM products LIMIT 5;

SELECT * FROM products LIMIT 2 OFFSET 1;

-- -------------------------------
-- OUTRO EXEMPLO TABELA
-- -------------------------------

CREATE TABLE aulas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  period VARCHAR(10) CHECK(period = 'MATUTINO' OR period = 'VERPERTINO' OR period = 'NOTURNO')
);

INSERT INTO aulas (name, period) VALUES
('go bases I', 'MATUTINO'),
('go bases I', 'VERPERTINO'),
('go bases II', 'MATUTINO'),
('go bases II', 'VERPERTINO'),
('go bases III', 'VERPERTINO');

SELECT DISTINCT name FROM aulas;

-- -------------------------------
-- OUTRO EXEMPLO TABELA
-- -------------------------------

CREATE TABLE boletim (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  nota1 DECIMAL(4,2) DEFAULT 0,
  nota2 DECIMAL(4,2) DEFAULT 0,
  nota3 DECIMAL(4,2) DEFAULT 0,
  nota4 DECIMAL(4,2) DEFAULT 0
);

INSERT INTO boletim(name, nota1, nota2, nota3, nota4) VALUES 
('João', 10, 8, 7, 6),
('Paulo', 9, 9, 6, 10),
('Milena', 7, 9, 8, 10),
('Mayara', 10, 10, 10, 9);

-- FUNÇÕES DE AGREGAÇÃO

-- COUNT
SELECT count(*) as 'Contagem' FROM boletim;

-- MIN
SELECT MIN(nota1) FROM boletim;

-- MAX
SELECT MAX(nota1) FROM boletim;

-- SUM
SELECT (SUM(nota1) / COUNT(nota1)) as 'media' FROM boletim;

SELECT TRUNCATE((SUM(nota1) / COUNT(nota1)), 2) as 'media' FROM boletim;
SELECT ROUND((SUM(nota1) / COUNT(nota1)), 2) as 'media' FROM boletim;

-- AVG
SELECT AVG(nota1) as 'media' FROM boletim;










