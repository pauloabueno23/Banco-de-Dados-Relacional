create database bd_aula04;
CREATE DATABASE
bd_aula03=# \c bd_aula04
Agora você está conectado ao banco de dados "bd_aula04" como usuário "postgres".
bd_aula04=# create domain chk_categoria VARCHAR check (value='DRAMA' or value='COMEDIA');
CREATE DOMAIN
bd_aula04=# create domain chk_status VARCHAR check (value='DISPONIVEL' or value='ALUGADO');
CREATE DOMAIN
bd_aula04=# create table tbl_cliente (codigo_cliente INTEGER PRIMARY KEY, nome VARCHAR NOT NULL, cidade VARCHAR, endereco VARCHAR);
CREATE TABLE
bd_aula04=# create table tbl_titulo (codigo_titulo INTEGER primary key, titulo VARCHAR NOT NULL, descricao VARCHAR, categoria chk_categoria);
CREATE TABLE
bd_aula04=# create table tbl_livros (cod_livro INTEGER PRIMARY KEY, codigo_titulo INTEGER REFERENCES tbl_titulo(codigo_titulo), status chk_status DEFAULT 'DISPONIVEL');
CREATE TABLE
bd_aula04=# create table tbl_emprestimo (numero_emprestimo INTEGER PRIMARY KEY, codigo_cliente INTEGER REFERENCES tbl_cliente(codigo_cliente), codigo_livro INTEGER REFERENCES tbl_livros(cod_livro));
CREATE TABLE
bd_aula04=#
bd_aula04=# INSERT INTO tbl_cliente (codigo_cliente, nome, cidade, endereco)
bd_aula04-# VALUES
bd_aula04-#     (1, 'João Silva', 'São Paulo', 'Rua A, 123'),
bd_aula04-#     (2, 'Maria Santos', 'Rio de Janeiro', 'Av. B, 456'),
bd_aula04-#     (3, 'Pedro Almeida', 'Belo Horizonte', 'Rua C, 789'),
bd_aula04-#     (4, 'Ana Oliveira', 'Salvador', 'Av. D, 1011'),
bd_aula04-#     (5, 'Carlos Lima', 'Brasília', 'Rua E, 1213');
INSERT 0 5
bd_aula04=#
bd_aula04=# INSERT INTO tbl_titulo (codigo_titulo, titulo, descricao, categoria)
bd_aula04-# VALUES
bd_aula04-#     (1, 'Aventuras Urbanas', 'Uma história emocionante', 'DRAMA'),
bd_aula04-#     (2, 'Mistérios Antigos', 'Enigmas por resolver', 'COMEDIA'),
bd_aula04-#     (3, 'Amor nas Estrelas', 'Um romance intergaláctico', 'DRAMA'),
bd_aula04-#     (4, 'Código Enigmático', 'Segredos ocultos', 'COMEDIA'),
bd_aula04-#     (5, 'Histórias Perdidas', 'Contos esquecidos', 'DRAMA');
INSERT 0 5
bd_aula04=#
bd_aula04=# INSERT INTO tbl_livros (cod_livro, codigo_titulo, status)
bd_aula04-# VALUES
bd_aula04-#     (1, 1, 'DISPONIVEL'),
bd_aula04-#     (2, 1, 'ALUGADO'),
bd_aula04-#     (3, 2, 'DISPONIVEL'),
bd_aula04-#     (4, 3, 'ALUGADO'),
bd_aula04-#     (5, 4, 'DISPONIVEL');
INSERT 0 5
bd_aula04=#
bd_aula04=# INSERT INTO tbl_emprestimo (numero_emprestimo, codigo_cliente, codigo_livro)
bd_aula04-# VALUES
bd_aula04-#     (1, 1, 2),
bd_aula04-#     (2, 2, 4),
bd_aula04-#     (3, 3, 1),
bd_aula04-#     (4, 4, 5),
bd_aula04-#     (5, 5, 3);
INSERT 0 5
bd_aula04=#
bd_aula04=# select * from tbl_cliente;
 codigo_cliente |     nome      |     cidade     |  endereco
----------------+---------------+----------------+-------------
              1 | João Silva    | São Paulo      | Rua A, 123
              2 | Maria Santos  | Rio de Janeiro | Av. B, 456
              3 | Pedro Almeida | Belo Horizonte | Rua C, 789
              4 | Ana Oliveira  | Salvador       | Av. D, 1011
              5 | Carlos Lima   | Brasília       | Rua E, 1213
(5 linhas)


bd_aula04=#
bd_aula04=# select * from tbl_cliente where cidade = 'São Paulo';
 codigo_cliente |    nome    |  cidade   |  endereco
----------------+------------+-----------+------------
              1 | João Silva | São Paulo | Rua A, 123
(1 linha)


bd_aula04=#
bd_aula04=# select * from tbl_cliente where codigo_cliente > 3;
 codigo_cliente |     nome     |  cidade  |  endereco
----------------+--------------+----------+-------------
              4 | Ana Oliveira | Salvador | Av. D, 1011
              5 | Carlos Lima  | Brasília | Rua E, 1213
(2 linhas)


bd_aula04=#
bd_aula04=# select * from tbl_titulo;
 codigo_titulo |       titulo       |         descricao         | categoria
---------------+--------------------+---------------------------+-----------
             1 | Aventuras Urbanas  | Uma história emocionante  | DRAMA
             2 | Mistérios Antigos  | Enigmas por resolver      | COMEDIA
             3 | Amor nas Estrelas  | Um romance intergaláctico | DRAMA
             4 | Código Enigmático  | Segredos ocultos          | COMEDIA
             5 | Histórias Perdidas | Contos esquecidos         | DRAMA
(5 linhas)


bd_aula04=#
bd_aula04=# CREATE table tbl_cliente2 (codigo integer);
CREATE TABLE
bd_aula04=# insert into tbl_cliente2 select codigo_cliente from tbl_cliente;
INSERT 0 5
bd_aula04=#
bd_aula04=# UPDATE tbl_livros SET status = 'DISPONIVEL' where status = 'ALUGADO';
UPDATE 2
bd_aula04=#
bd_aula04=# DELETE FROM tbl_cliente2 where codigo > 3;
DELETE 2
bd_aula04=#
bd_aula04=# create schema Paulo;
CREATE SCHEMA
bd_aula04=#