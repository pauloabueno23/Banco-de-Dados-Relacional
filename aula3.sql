bd_aula03=# create domain chk_categoria text check (value='DRAMA' or value='COMEDIA');
CREATE DOMAIN
bd_aula03=# create domain chk_status text check (value='DISPONIVEL' or value='ALUGADO');
CREATE DOMAIN
bd_aula03=# create table tbl_cliente (codigo_cliente INTEGER PRIMARY KEY, nome VARCHAR not null,
bd_aula03(# cidade VARCHAR, endereco VARCHAR);
CREATE TABLE
bd_aula03=# create table tbl_titulo (codigo_titulo INTEGER primary key, titulo VARCHAR not null,
bd_aula03(# descricao VARCHAR, categoria chk_categoria);
CREATE TABLE
bd_aula03=# create table tbl_livros (cod_livro INTEGER PRIMARY KEY,
bd_aula03(# codigo_titulo INTEGER REFERENCES tbl_titulo(codigo_titulo), status chk_status
bd_aula03(# DEFAULT 'DISPONIVEL');
CREATE TABLE
bd_aula03=# create table tbl_emprestimo (numero_emprestimo INTEGER PRIMARY KEY,
bd_aula03(# codigo_cliente INTEGER REFERENCES tbl_cliente(codigo_cliente),
bd_aula03(# codigo_livro INTEGER REFERENCES tbl_livros(cod_livro));
CREATE TABLE
bd_aula03=# \d
              Lista de relaþ§es
 Esquema |      Nome      |  Tipo  |   Dono
---------+----------------+--------+----------
 public  | tbl_cliente    | tabela | postgres
 public  | tbl_emprestimo | tabela | postgres
 public  | tbl_livros     | tabela | postgres
 public  | tbl_titulo     | tabela | postgres
(4 linhas)


bd_aula03=# create schema Paulo;
CREATE SCHEMA
bd_aula03=#
