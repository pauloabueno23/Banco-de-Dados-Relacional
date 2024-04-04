postgres=# create database bd_aula08;
CREATE DATABASE
postgres=# \c bd_aula08
Agora você está conectado ao banco de dados "bd_aula08" como usuário "postgres".
bd_aula08=# create table tbl_fornecedor (cod_fornecedor SERIAL PRIMARY KEY, nome VARCHAR NOT NULL, status INTEGER, cidade VARCHAR);
CREATE TABLE
bd_aula08=# create table tbl_peca (cod_peca SERIAL PRIMARY KEY, nome VARCHAR NOT NULL, cor VARCHAR, preco NUMERIC, cidade VARCHAR);
CREATE TABLE
bd_aula08=# create table tbl_estoque (cod_compra SERIAL PRIMARY KEY,cod_fornecedor INTEGER references tbl_fornecedor(cod_fornecedor),cod_peca INTEGER references tbl_peca(cod_peca),quantidade INTEGER);
CREATE TABLE
bd_aula08=#
bd_aula08=# insert into tbl_fornecedor(nome,status,cidade)
bd_aula08-# values ('A',30,'LONDRES'),('B',20,'PARIS'),('C',10,'PARIS'),('D',10,'LONDRES');
INSERT 0 4
bd_aula08=#
bd_aula08=# INSERT INTO tbl_peca(nome, cor, preco, cidade) values
bd_aula08-# ('PLACA','AZUL',5,'LONDRES'),('MESA','VERMELHA',10,'PARIS'),('CADERNO','PRETA',14,'ROMA'),
bd_aula08-# ('TESOURA','VERMELHA',12,'LONDRES');
INSERT 0 4
bd_aula08=#
bd_aula08=# INSERT INTO tbl_estoque(cod_fornecedor, cod_peca, quantidade) values
bd_aula08-# (1,1,30),(2,1,30),(3,2,10),(3,3,50);
INSERT 0 4
bd_aula08=#
bd_aula08=#
bd_aula08=# SELECT nome, cidade
bd_aula08-# FROM tbl_fornecedor
bd_aula08-# WHERE cod_fornecedor IN (
bd_aula08(# SELECT cod_fornecedor
bd_aula08(# FROM tbl_estoque
bd_aula08(# WHERE quantidade >10 AND cod_peca=1)
bd_aula08-#
bd_aula08-# SELECT nome
bd_aula08-# FROM tbl_peca
bd_aula08-# WHERE preco > 10 AND cod_peca IN (
bd_aula08(#     SELECT cod_peca
bd_aula08(#     FROM tbl_estoque
bd_aula08(# );
ERRO:  erro de sintaxe em ou próximo a "SELECT"
LINHA 7: SELECT nome
         ^
bd_aula08=#
bd_aula08=# SELECT nome
bd_aula08-# FROM tbl_peca
bd_aula08-# WHERE cod_peca NOT IN (
bd_aula08(#     SELECT cod_peca
bd_aula08(#     FROM tbl_estoque
bd_aula08(# );
  nome
---------
 TESOURA
(1 linha)


bd_aula08=#
bd_aula08=# SELECT nome
bd_aula08-# FROM tbl_peca
bd_aula08-# WHERE cod_peca IN (
bd_aula08(#     SELECT cod_peca
bd_aula08(#     FROM tbl_estoque
bd_aula08(#     WHERE quantidade > 20
bd_aula08(# );
  nome
---------
 PLACA
 CADERNO
(2 linhas)


bd_aula08=#
bd_aula08=# SELECT * FROM tbl_peca
bd_aula08-# EXCEPT
bd_aula08-# SELECT * FROM tbl_peca WHERE nome='PLACA'
bd_aula08-# order by nome;
 cod_peca |  nome   |   cor    | preco | cidade
----------+---------+----------+-------+---------
        3 | CADERNO | PRETA    |    14 | ROMA
        2 | MESA    | VERMELHA |    10 | PARIS
        4 | TESOURA | VERMELHA |    12 | LONDRES
(3 linhas)


bd_aula08=#
bd_aula08=# select nome, cor
bd_aula08-# from tbl_peca
bd_aula08-# where cod_peca IN (
bd_aula08(# select e.cod_peca from tbl_fornecedor f
bd_aula08(# inner join tbl_estoque e on (f.cod_fornecedor=e.cod_fornecedor)
bd_aula08(# where nome='C'
bd_aula08(# )
bd_aula08-# order by 1
bd_aula08-#
bd_aula08-# SELECT nome,cor FROM tbl_peca
bd_aula08-# INTERSECT
bd_aula08-# SELECT nome,cor FROM tbl_peca WHERE cidade='LONDRES'
bd_aula08-#
bd_aula08-# SELECT nome
bd_aula08-# FROM tbl_peca
bd_aula08-# WHERE cod_peca IN (
bd_aula08(#     SELECT cod_peca
bd_aula08(#     FROM tbl_estoque
bd_aula08(#     WHERE cidade = 'LONDRES'
bd_aula08(# ) EXCEPT
bd_aula08-# SELECT nome
bd_aula08-# FROM tbl_peca
bd_aula08-# WHERE cod_peca IN (
bd_aula08(#     SELECT cod_peca
bd_aula08(#     FROM tbl_estoque
bd_aula08(#     WHERE cidade = 'PARIS'
bd_aula08(# );
ERRO:  erro de sintaxe em ou próximo a "SELECT"
LINHA 9: SELECT nome,cor FROM tbl_peca
         ^
bd_aula08=#
bd_aula08=# SELECT DISTINCT(cod_peca) FROM tbl_estoque
bd_aula08-# WHERE quantidade > ALL(
bd_aula08(# SELECT quantidade FROM tbl_estoque
bd_aula08(# WHERE cod_peca=2)\d
                         Lista de relaþ§es
 Esquema |               Nome                |   Tipo    |   Dono
---------+-----------------------------------+-----------+----------
 public  | tbl_estoque                       | tabela    | postgres
 public  | tbl_estoque_cod_compra_seq        | sequÛncia | postgres
 public  | tbl_fornecedor                    | tabela    | postgres
 public  | tbl_fornecedor_cod_fornecedor_seq | sequÛncia | postgres
 public  | tbl_peca                          | tabela    | postgres
 public  | tbl_peca_cod_peca_seq             | sequÛncia | postgres
(6 linhas)


bd_aula08-# create schema Paulo;
         ^
bd_aula08=# create schema Paulo;
CREATE SCHEMA
bd_aula08=#
