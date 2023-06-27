/* PRÁTICA BANCO DE DADOS SQL */ 

-- criando um banco de dados
CREATE DATABASE IF NOT EXISTS pratica;
USE pratica;

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

-- Exemplo de update 
UPDATE pessoas SET salary=15000 WHERE id=1;
UPDATE pessoas 
SET salary=20000
WHERE id = 2; 

-- exemplo de delete
DELETE FROM pessoas;


SELECT * FROM pessoas;

-- snake_case
DROP TABLE aluguel;
create table aluguel(
  user_id int,
  book_id int,
	data_aluguel date,
  CONSTRAINT PK_aluguel PRIMARY KEY (user_id , book_id, data_aluguel)
); 

DESCRIBE aluguel;

DROP TABLE course;
CREATE TABLE course (
  id int primary key auto_increment,
  name varchar(50)
);

DROP TABLE students;
CREATE TABLE students (
  id int primary key auto_increment,
  name varchar(50)
);

DROP TABLE classes;
CREATE TABLE classes (
  student_id int,
  course_id int,
  FOREIGN KEY (student_id) REFERENCES students(id),
  FOREIGN KEY (course_id) REFERENCES course(id)
);

INSERT INTO classes VALUES 
(1, 1),
(2, 1),
(2, 2),
(3, 1); 

DESCRIBE classes;