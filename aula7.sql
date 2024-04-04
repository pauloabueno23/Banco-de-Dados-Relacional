postgres=# create database bd_aula07;
CREATE DATABASE
postgres=# \c bd_aula07
Agora você está conectado ao banco de dados "bd_aula07" como usuário "postgres".
bd_aula07=# create table tbl_fornecedor (cod_fornecedor SERIAL PRIMARY KEY, nome VARCHAR NOT NULL, status INTEGER, cidade VARCHAR);
CREATE TABLE
bd_aula07=# create table tbl_peca (cod_peca SERIAL PRIMARY KEY, nome VARCHAR NOT NULL, cor VARCHAR, preco NUMERIC, cidade VARCHAR);
CREATE TABLE
bd_aula07=# create table tbl_estoque (cod_compra SERIAL PRIMARY KEY, cod_fornecedor INTEGER references tbl_fornecedor(cod_fornecedor),cod_peca integer references tbl_peca(cod_peca),quantidade INTEGER);
CREATE TABLE
bd_aula07=#
bd_aula07=# insert into tbl_fornecedor(nome,status,cidade)
bd_aula07-# values ('A',30,'LONDRES'),('B',20,'PARIS'),('C',10,'PARIS'),('D',10,'LONDRES');
INSERT 0 4
bd_aula07=#
bd_aula07=# INSERT INTO tbl_peca(nome, cor, preco, cidade) values
bd_aula07-# ('PLACA','AZUL',5,'LONDRES'),('MESA','VERMELHA',10,'PARIS'),('CADERNO','PRETA',14,'ROMA'),
bd_aula07-# ('TESOURA','VERMELHA',12,'LONDRES');
INSERT 0 4
bd_aula07=#
bd_aula07=# INSERT INTO tbl_estoque(cod_fornecedor, cod_peca, quantidade) values
bd_aula07-# (1,1,30),(2,1,30),(3,2,10),(3,3,50);
INSERT 0 4
bd_aula07=#
bd_aula07=# select upper(f.nome), lower(p.nome)
bd_aula07-# from tbl_fornecedor f
bd_aula07-# inner join tbl_peca p on f.cidade=p.cidade
bd_aula07-# order by f.nome
bd_aula07-#
bd_aula07-#
bd_aula07-# select distinct(cidade) from tbl_fornecedor
bd_aula07-#
bd_aula07-# select p.nome, p.cor
bd_aula07-# from tbl_peca p
bd_aula07-# inner join tbl_estoque e on p.cod_peca=e.cod_peca
bd_aula07-# where e.cod_fornecedor=3
bd_aula07-# order by 1
bd_aula07-#
bd_aula07-# select f.nome, f.cidade
bd_aula07-# from tbl_fornecedor f
bd_aula07-# inner join tbl_estoque e on f.cod_fornecedor=e.cod_fornecedor
bd_aula07-# where e.quantidade >10 and e.cod_peca=1
bd_aula07-#
bd_aula07-# select sum(e.quantidade)
bd_aula07-# from tbl_estoque e
bd_aula07-# where e.cod_peca=1
bd_aula07-#
bd_aula07-# select avg(p.preco)
bd_aula07-# from tbl_peca p
bd_aula07-# inner join tbl_estoque e on p.cod_peca = e.cod_peca
bd_aula07-# where e.cod_fornecedor = 3
bd_aula07-#
bd_aula07-# select max(preco) as "Mais cara", min(preco) as "Mais Barata"
bd_aula07-# from tbl_peca
bd_aula07-#
bd_aula07-# select count(*) "Quantidade" from tbl_peca
bd_aula07-#
bd_aula07-# select count(distinct(cidade)) "Quantidade Cidades" from tbl_peca
bd_aula07-#
bd_aula07-# select round(avg(preco),1) from tbl_peca
bd_aula07-# \d
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
         ^
bd_aula07=# create schema Paulo;
CREATE SCHEMA
bd_aula07=#