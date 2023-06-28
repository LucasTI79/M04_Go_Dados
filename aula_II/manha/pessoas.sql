/* PRÁTICA BANCO DE DADOS SQL */ 

-- criando um banco de dados
CREATE DATABASE IF NOT EXISTS pratica;

-- criando a tabela pessoas
DROP TABLE pessoas;
CREATE TABLE pessoas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  firstname VARCHAR(20) NOT NULL,
  phone VARCHAR(15),
  cpf VARCHAR(15),
  lastname VARCHAR(30),
  birthday DATE,
  gender CHAR(1) CHECK(gender = "M" OR gender = "F" OR gender = "U"),
  salary DECIMAL(10,2),
  verify BIT DEFAULT 0
);

-- UNIQUE, CHECK, NOT NULL, etc, se chama constraints

-- verifica a estrutura da tabela
DESCRIBE pessoas;
-- alterando a estrutura de uma tabela que já foi criada
ALTER TABLE pessoas MODIFY COLUMN phone VARCHAR(50);
ALTER TABLE pessoas ADD COLUMN email VARCHAR(20) UNIQUE NOT NULL;
ALTER TABLE pessoas MODIFY COLUMN email VARCHAR(100) UNIQUE NOT NULL;


-- inserindo dados

INSERT INTO pessoas VALUES 
(null, 'Paulo', '+55(011)99999-9999', '', 'Vinicius', '2002-08-22', 'M', 0.00, DEFAULT, 'lucas.feitosa@digitalhouse.com');

INSERT INTO pessoas(firstname, gender, email) VALUES ('anwar', 'M','anwar@digitalhouse.com');

-- Exemplo de inserção múltipla 
INSERT INTO pessoas(firstname, gender, email, salary) VALUES 
('adriana', 'F','adriana@digitalhouse.com', 20000),
('duda', 'F','duda@digitalhouse.com', 20000),
('maicon', 'M','maicon@digitalhouse.com', 20000);

INSERT INTO pessoas(firstname, gender, email, salary) VALUES
('lucas', 'M', 'lucas@digitalhouse.com', 20000);

-- Exemplo de update 
UPDATE pessoas SET salary=15000 WHERE id=1;
UPDATE pessoas 
SET salary=20000
WHERE id = 2; 

-- exemplo de delete
DELETE FROM pessoas;

CREATE TABLE cidades (
 id int AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(50)
);



-- adicionamos uma coluna fk_cidade e definimos que ela é uma foreign key
ALTER TABLE pessoas ADD COLUMN fk_cidade int;
ALTER TABLE pessoas ADD FOREIGN KEY (fk_cidade) REFERENCES cidades(id);

DESCRIBE pessoas;
SELECT * FROM pessoas;

-- Atualizando a tabela de pessoas com os ids das cidades correspondentes
UPDATE pessoas SET fk_cidade=1 WHERE id = 9;
UPDATE pessoas SET fk_cidade=8 WHERE id = 10;
UPDATE pessoas SET fk_cidade=7 WHERE id = 11;
UPDATE pessoas SET fk_cidade=1, salary = 10000 WHERE id = 13;

-- select com inner join sem alias
SELECT pessoas.firstname, cidades.nome 
FROM pessoas
INNER JOIN cidades
ON pessoas.fk_cidade = cidades.id;

-- select com inner join e com alias
SELECT p.firstname, c.nome 
FROM pessoas p
INNER JOIN cidades c
ON p.fk_cidade = c.id;

-- Trazendo todas as pessoas, e se tiver cidade vinculada a ela, trás o nome da cidade;
SELECT p.firstname, c.nome 
FROM pessoas p
LEFT JOIN cidades c
ON p.fk_cidade = c.id;

-- trazendo todas as cidades, e se tem alguma pessoa vinculada a ela, 
-- senão tiver, retorna null
SELECT p.firstname, c.nome 
FROM pessoas p
RIGHT JOIN cidades c
ON p.fk_cidade = c.id;

-- faça uma média de salário por cidade, traga essa média e o nome da cidade
-- quando falamos "por", se refere a um grupo

-- o group é muito usado quando queremos agrupar registros e 
-- aplicar funções de agregação sobre ele
SELECT 
cidades.nome as "Nome da cidade",
ROUND(AVG(pessoas.salary), 2) as "Média de salário"
FROM pessoas
INNER JOIN cidades
ON pessoas.fk_cidade = cidades.id
GROUP BY cidades.nome;


-- filtros no group by são aplicados com a cláusula "Having"

SELECT 
cidades.nome as "Nome da cidade",
ROUND(AVG(pessoas.salary), 2) as "media"
FROM pessoas
INNER JOIN cidades
ON pessoas.fk_cidade = cidades.id
GROUP BY cidades.nome
HAVING media >= 20000;

-- -> view

-- Selecione o primero nome das pessoas que são da cidade de São Paulo
-- Essa é a consulta principal
SELECT pessoas.firstname 
FROM pessoas
WHERE pessoas.fk_cidade = 
-- Essa é a subconsulta
(SELECT id FROM cidades WHERE nome="São Paulo" LIMIT 1);















