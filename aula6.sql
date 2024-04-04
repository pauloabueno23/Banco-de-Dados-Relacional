create database bd_aula06;
CREATE DATABASE
bd_aula04=# \c bd_aula06
Agora você está conectado ao banco de dados "bd_aula06" como usuário "postgres".
bd_aula06=# create domain chk_categoria VARCHAR check (value='DRAMA' or value='COMEDIA');
CREATE DOMAIN
bd_aula06=# create domain chk_status VARCHAR check (value='DISPONIVEL' or value='ALUGADO');
CREATE DOMAIN
bd_aula06=# create table tbl_cliente (codigo_cliente INTEGER PRIMARY KEY, nome VARCHAR NOT NULL, cidade VARCHAR, endereco VARCHAR);
CREATE TABLE
bd_aula06=# create table tbl_titulo (codigo_titulo INTEGER PRIMARY KEY, titulo VARCHAR NOT NULL, descricao VARCHAR, categoria chk_categoria);
CREATE TABLE
bd_aula06=# create table tbl_livros (cod_livro INTEGER PRIMARY KEY, codigo_titulo INTEGER REFERENCES tbl_titulo(codigo_titulo), status chk_status DEFAULT 'DISPONIVEL');
CREATE TABLE
bd_aula06=# create table tbl_emprestimo (numero_emprestimo INTEGER PRIMARY KEY, codigo_cliente INTEGER REFERENCES tbl_cliente(codigo_cliente), codigo_livro INTEGER REFERENCES tbl_livros(cod_livro));
CREATE TABLE
bd_aula06=# INSERT INTO tbl_cliente (codigo_cliente, nome, cidade, endereco)
bd_aula06-# VALUES
bd_aula06-#     (1, 'Joao Silva', 'Sao Paulo', 'Rua A, 123'),
bd_aula06-#     (2, 'Maria Santos', 'Rio de Janeiro', 'Av. B, 456'),
bd_aula06-#     (3, 'Pedro Almeida', 'Belo Horizonte', 'Rua C, 789'),
bd_aula06-#     (4, 'Ana Oliveira', 'Salvador', 'Av. D, 1011'),
bd_aula06-#     (5, 'Carlos Lima', 'Brasília', 'Rua E, 1213');
INSERT 0 5
bd_aula06=# INSERT INTO tbl_titulo (codigo_titulo, titulo, descricao, categoria)
bd_aula06-# VALUES
bd_aula06-#     (1, 'Aventuras Urbanas', 'Uma história emocionante', 'DRAMA'),
bd_aula06-#     (2, 'Mistérios Antigos', 'Enigmas por resolver', 'COMEDIA'),
bd_aula06-#     (3, 'Amor nas Estrelas', 'Um romance intergaláctico', 'DRAMA'),
bd_aula06-#     (4, 'Código Enigmatico', 'Segredos ocultos', 'COMEDIA'),
bd_aula06-#     (5, 'Histórias Perdidas', 'Contos esquecidos', 'DRAMA');
INSERT 0 5
bd_aula06=# INSERT INTO tbl_livros (cod_livro, codigo_titulo, status)
bd_aula06-# VALUES
bd_aula06-#     (1, 1, 'ALUGADO'),
bd_aula06-#     (2, 1, 'ALUGADO'),
bd_aula06-#     (3, 2, 'DISPONIVEL'),
bd_aula06-#     (4, 3, 'ALUGADO'),
bd_aula06-#     (5, 4, 'ALUGADO');
INSERT 0 5
bd_aula06=# INSERT INTO tbl_emprestimo (numero_emprestimo, codigo_cliente, codigo_livro)
bd_aula06-# VALUES
bd_aula06-#     (1, 1, 2),
bd_aula06-#     (2, 2, 4),
bd_aula06-#     (3, 3, 1),
bd_aula06-#     (4, 4, 5);
INSERT 0 4
bd_aula06=# SELECT t.titulo, l.status
bd_aula06-# FROM tbl_titulo t
bd_aula06-# LEFT JOIN tbl_livros l ON t.codigo_titulo = l.codigo_titulo;
       titulo       |   status
--------------------+------------
 Aventuras Urbanas  | ALUGADO
 Aventuras Urbanas  | ALUGADO
 Mistérios Antigos  | DISPONIVEL
 Amor nas Estrelas  | ALUGADO
 Código Enigmatico  | ALUGADO
 Histórias Perdidas |
(6 linhas)


bd_aula06=# SELECT t.titulo, t.descricao
bd_aula06-# FROM tbl_titulo t
bd_aula06-# INNER JOIN tbl_livros l ON t.codigo_titulo = l.codigo_titulo
bd_aula06-# WHERE l.status = 'ALUGADO';
      titulo       |         descricao
-------------------+---------------------------
 Aventuras Urbanas | Uma história emocionante
 Aventuras Urbanas | Uma história emocionante
 Amor nas Estrelas | Um romance intergaláctico
 Código Enigmatico | Segredos ocultos
(4 linhas)


bd_aula06=# SELECT c.nome
bd_aula06-# FROM tbl_cliente c
bd_aula06-# LEFT JOIN tbl_emprestimo e ON c.codigo_cliente = e.codigo_cliente
bd_aula06-# WHERE e.numero_emprestimo IS NULL;
    nome
-------------
 Carlos Lima
(1 linha)


bd_aula06=# SELECT t.titulo, t.categoria
bd_aula06-# FROM tbl_titulo t
bd_aula06-# INNER JOIN tbl_livros l ON t.codigo_titulo = l.codigo_titulo
bd_aula06-# WHERE l.status = 'DISPONIVEL';
      titulo       | categoria
-------------------+-----------
 Mistérios Antigos | COMEDIA
(1 linha)


bd_aula06=# SELECT c.nome, t.titulo
bd_aula06-# FROM tbl_cliente c
bd_aula06-# LEFT JOIN tbl_emprestimo e ON c.codigo_cliente = e.codigo_cliente
bd_aula06-# LEFT JOIN tbl_livros l ON e.codigo_livro = l.cod_livro
bd_aula06-# LEFT JOIN tbl_titulo t ON l.codigo_titulo = t.codigo_titulo;
     nome      |      titulo
---------------+-------------------
 Joao Silva    | Aventuras Urbanas
 Maria Santos  | Amor nas Estrelas
 Pedro Almeida | Aventuras Urbanas
 Ana Oliveira  | Código Enigmatico
 Carlos Lima   |
(5 linhas)


bd_aula06=# select c.nome,t.titulo,l.status
bd_aula06-# from tbl_cliente as c
bd_aula06-# inner join tbl_emprestimo e on c.codigo_cliente=e.codigo_cliente
bd_aula06-# inner join tbl_livros l on e.codigo_livro=l.cod_livro
bd_aula06-# inner join tbl_titulo t on l.codigo_titulo=t.codigo_titulo
bd_aula06-# where nome = 'Ana Oliveira'
bd_aula06-# create schema Paulo;
ERRO:  erro de sintaxe em ou próximo a "create"
