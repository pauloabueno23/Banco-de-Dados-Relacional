Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]:
Password for user postgres:
psql (14.2)

postgres=# CREATE TABLE tabela1
postgres-# CREATE TABLE tabela2 (coluna1 integer);
ERROR:  syntax error at or near "CREATE"
LINE 2: CREATE TABLE tabela2 (coluna1 integer);
        ^
postgres=# CREATE TABLE TABELA1 (COLUNA1 INTEGER);
CREATE TABLE
postgres=# CREATE TABLE TABELA2 (COLUNA1 CHAR);
CREATE TABLE
postgres=# CREATE TABLE TABELA3 (COLUNA1 VARCHAR, COLUNA2 DATE);
CREATE TABLE
postgres=# CREATE TABLE TABELA4 (COLUNA1 BOOLEAN, COLUNA2 REAL);
CREATE TABLE
postgres=# CREATE TABLE TABELA5 (COLUNA1 CHAR);
CREATE TABLE
postgres=# CREATE TABLE CLIENTE (NOME_CLIENTE CHAR, CIDADE_CLIENTE CHAR,ENDERECO_CLIENTE CHAR);
CREATE TABLE
postgres=# CREATE TABLE CONTA (NUMERO_CONTA INTEGER, NOME_AGENCIA CHAR, SALDO INTEGER);
CREATE TABLE
postgres=# CREATE TABLE EMPRESTIMO (NUMERO_EMPRESTIMO INTEGER, NOME_AGENCIA CHAR, VALOR INTEGER);
CREATE TABLE
postgres=# CREATE TABLE AGENCIA (NOME_AGENCIA CHAR, CIDADE_AGENCIA CHAR, DEPOSITOS INTEGER);
CREATE TABLE
postgres=# \dt
           List of relations
 Schema |    Name    | Type  |  Owner
--------+------------+-------+----------
 public | agencia    | table | postgres
 public | cliente    | table | postgres
 public | conta      | table | postgres
 public | emprestimo | table | postgres
 public | tabela1    | table | postgres
 public | tabela2    | table | postgres
 public | tabela3    | table | postgres
 public | tabela4    | table | postgres
 public | tabela5    | table | postgres
(9 rows)


postgres=# DROP TABLE tabela1
postgres-# DROP TABLE tabela2
postgres-# DROP TABLE tabela3
postgres-# DROP TABLE tabela4
postgres-# DROP TABLE tabela5
postgres-# \dl
      Large objects
 ID | Owner | Description
----+-------+-------------
(0 rows)


postgres-# \dt
           List of relations
 Schema |    Name    | Type  |  Owner
--------+------------+-------+----------
 public | agencia    | table | postgres
 public | cliente    | table | postgres
 public | conta      | table | postgres
 public | emprestimo | table | postgres
 public | tabela1    | table | postgres
 public | tabela2    | table | postgres
 public | tabela3    | table | postgres
 public | tabela4    | table | postgres
 public | tabela5    | table | postgres
(9 rows)


postgres-# DROP TABLE tabela1;
ERROR:  syntax error at or near "DROP"
LINE 2: DROP TABLE tabela2
        ^
postgres=# DROP TABLE tabela1;
DROP TABLE
postgres=# DROP TABLE tabela2;
DROP TABLE
postgres=# DROP TABLE tabela3;
DROP TABLE
postgres=# DROP TABLE tabela4;
DROP TABLE
postgres=# DROP TABLE tabela5;
DROP TABLE
postgres=# \dt
           List of relations
 Schema |    Name    | Type  |  Owner
--------+------------+-------+----------
 public | agencia    | table | postgres
 public | cliente    | table | postgres
 public | conta      | table | postgres
 public | emprestimo | table | postgres
(4 rows)


postgres=# ALTER TABLE CLIENTE ADD COLUMN IDADE INTEGER;
ALTER TABLE
postgres=# ALTER TABLE CLIENTE ADD COLUMN CPF INTEGER;
ALTER TABLE
postgres=# ALTER TABLE CLIENTE RENAME TO TBL_CLIENTE;
ALTER TABLE
postgres=# ALTER TABLE CONTA RENAME TO TBL_CONTA;
ALTER TABLE
postgres=# ALTER TABLE EMPRESTIMO RENAME TO TBL_EMPRESTIMO;
ALTER TABLE
postgres=# ALTER TABLE AGENCIA RENAME TO TBL_AGENCIA;
ALTER TABLE
postgres=# \DT
invalid command \DT
Try \? for help.
postgres=# \dt
             List of relations
 Schema |      Name      | Type  |  Owner
--------+----------------+-------+----------
 public | tbl_agencia    | table | postgres
 public | tbl_cliente    | table | postgres
 public | tbl_conta      | table | postgres
 public | tbl_emprestimo | table | postgres
(4 rows)


