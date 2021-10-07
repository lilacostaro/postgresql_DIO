-- Comandos de Select

SELECT numero, nome, ativo FROM banco;
SELECT banco_numero, numero, nome FROM agencia;
SELECT numero, nome, email FROM cliente;
SELECT banco_numero, agencia_numero, numero, cliente_numero FROM conta_corrente;
SELECT id, nome FROM tipo_transacao;
SELECT banco_numero, agencia_numero, cliente_numero, valor FROM cliente_transacoes;

-- Melhores praticas na criação, modificação e remoção de tabelas

CREATE TABLE IF NOT EXISTS teste (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS teste;

CREATE TABLE IF NOT EXISTS teste (
	cpf VARCHAR(11) NOT NULL,
	nome VARCHAR(50) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (cpf)
);

-- Melhores praticas para inserção, modificação e remoção de valores de uma tabela.

INSERT INTO teste (cpf, nome, created_at) VALUES (02418475942, 'Camila Costa', now());

INSERT INTO teste (cpf, nome, created_at) VALUES (02418475942, 'Camila Costa', now()) ON CONFLICT (cpf) DO NOTHING;

UPDATE teste SET nome='Camila Rodrigues Costa' WHERE cpf = '2418475942';

-- Consulta dos campos da tabela!

SELECT * FROM information_schema.columns WHERE table_name = 'banco';
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'banco';
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'agencia';
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'cliente';
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'cliente_transacoes';
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'conta_corrente';
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'tipo_transacao';

-- Algumas operaçôes 

--AVG
--COUNT (having)
--MAX
--MIN
--SUM
-- algumas opcoes

SELECT * FROM cliente_transacoes;
SELECT AVG(valor) FROM cliente_transacoes;
SELECT SUM(valor) FROM cliente_transacoes;
SELECT STDDEV (valor) FROM cliente_transacoes;
SELECT STDDEV_POP (valor) FROM cliente_transacoes;
SELECT variance (valor) FROM cliente_transacoes;
SELECT VAR_POP (valor) FROM cliente_transacoes;
SELECT every(ativo) FROM banco; 

-- count

SELECT COUNT(numero) FROM banco;
SELECT COUNT(numero) FROM agencia;
SELECT COUNT(numero) FROM cliente;
SELECT COUNT(numero) FROM conta_corrente;
SELECT COUNT(id) FROM tipo_transacao;
SELECT COUNT(id) FROM cliente_transacoes;

SELECT COUNT(numero), email FROM cliente WHERE email ILIKE '%gmail.com';
--ERROR:  column "cliente.email" must appear in the GROUP BY clause or be used in an aggregate function
--LINE 1: SELECT COUNT(numero), email FROM cliente WHERE email ILIKE '...
SELECT COUNT(numero), email FROM cliente WHERE email ILIKE '%gmail.com' GROUP BY email;
SELECT COUNT(email) FROM cliente WHERE email ILIKE '%gmail.com' GROUP BY email;

-- MAX and MIN

SELECT MAX(numero) FROM cliente;
SELECT MAX(valor) FROM cliente_transacoes;

SELECT MIN(numero) FROM cliente;
SELECT MIN(valor) FROM cliente_transacoes;

-- Group by function

SELECT MAX(valor), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id;

SELECT MIN(valor), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id;

SELECT COUNT(id), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id;

SELECT COUNT(id), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id HAVING COUNT(id) > 150 and COUNT(id) < 800;

-- SUM

SELECT SUM(valor) FROM cliente_transacoes;

SELECT SUM(valor), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id;

-- order by

SELECT SUM(valor), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id ORDER BY tipo_transacao_id ASC;

SELECT SUM(valor), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id ORDER BY tipo_transacao_id DESC;

SELECT count(1) FROM banco;
SELECT count(1) FROM agencia;

-- Tipos de Join

--join
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

--agrupa os bancos com agencias cadastrdas
SELECT banco.numero
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero
GROUP BY banco.numero;


-- conta os bancos com agencias cadastradas
SELECT count(distinct banco.numero)
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

-- left join
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
LEFT JOIN agencia ON agencia.banco_numero = banco.numero;

-- left join agencia
SELECT agencia.numero, agencia.nome, banco.numero, banco.nome
FROM agencia
LEFT JOIN banco ON banco.numero = agencia.banco_numero;

--right join
SELECT agencia.numero, agencia.nome, banco.numero, banco.nome
FROM agencia
RIGHT JOIN banco ON banco.numero = agencia.banco_numero;

-- full join
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
FULL JOIN agencia ON agencia.banco_numero = banco.numero;

-- criação de tabelas para executar o cross join 

CREATE TABLE IF NOT EXISTS teste_a(id serial primary key, valor varchar(10));
CREATE TABLE IF NOT EXISTS teste_b(id serial primary key, valor varchar(10));

INSERT INTO teste_a (valor) VALUES ('teste1');
INSERT INTO teste_a (valor) VALUES ('teste2');
INSERT INTO teste_a (valor) VALUES ('teste3');
INSERT INTO teste_a (valor) VALUES ('teste4');
INSERT INTO teste_a (valor) VALUES ('teste5');

INSERT INTO teste_b (valor) VALUES ('teste_a');
INSERT INTO teste_b (valor) VALUES ('teste_b');
INSERT INTO teste_b (valor) VALUES ('teste_c');
INSERT INTO teste_b (valor) VALUES ('teste_d');
INSERT INTO teste_b (valor) VALUES ('teste_e');

SELECT * FROM teste_a;
SELECT * FROM teste_b;

--cross join
SELECT tbla.valor, tblb.valor
FROM teste_a tbla
CROSS JOIN teste_b tblb;

--criando conexao entre varias tabelas

SELECT banco.nome, agencia.nome, conta_corrente.numero, conta_corrente.digito, cliente.nome
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero
JOIN conta_corrente
	--ON conta_corrente.banco_numero = agencia.banco_numero
	ON conta_corrente.banco_numero = banco.numero
	AND conta_corrente.agencia_numero = agencia.numero
JOIN cliente
	ON cliente.numero = conta_corrente.cliente_numero;
	
	
SELECT count(1) FROM cliente_transacoes; -- 2018

-- 2018 rows effected check
SELECT banco.nome, agencia.numero, conta_corrente.numero, conta_corrente.digito, cliente.nome, tipo_transacao.nome, cliente_transacoes.valor
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero
JOIN conta_corrente
	--ON conta_corrente.banco_numero = agencia.banco_numero
	ON conta_corrente.banco_numero = banco.numero
	AND conta_corrente.agencia_numero = agencia.numero
JOIN cliente
	ON cliente.numero = conta_corrente.cliente_numero
JOIN cliente_transacoes
	ON cliente_transacoes.cliente_numero = cliente.numero
	AND cliente_transacoes.conta_corrente_numero = conta_corrente.numero
JOIN tipo_transacao
	ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id;

----------------------------------------------
-- SUBSELECT QUARY
----------------------------------------------
SELECT banco.numero, banco.nome
FROM banco
JOIN (
	SELECT 123 AS banco_numero
) params 
on params.banco_numero = banco_numero;

----------------------------------------------
--QUARYS COM WITH
----------------------------------------------
WITH tbl_tmp_banco AS (
	SELECT numero, nome
	FROM banco
)
SELECT numero, nome
FROM tbl_tmp_banco;

-----------------------------------------------------
--SELECIONAR UM BANCO ESPECIFICO
-----------------------------------------------------
WITH params AS (
	SELECT 213 AS banco_numero), tbl_tmp_banco AS (
	SELECT numero, nome
	FROM banco
	JOIN params ON params.banco_numero = banco.numero
)
SELECT numero, nome
FROM tbl_tmp_banco;

-----------------------------------------------------
WITH params AS (
	SELECT 260 AS banco_numero), tbl_tmp_banco AS (
	SELECT numero, nome
	FROM banco
	JOIN params ON params.banco_numero = banco.numero
)
SELECT numero, nome
FROM tbl_tmp_banco;

---------------------------------------------------------
WITH clientes_e_transacoes AS (
	SELECT cliente.nome AS cliente_nome,
	       tipo_transacao.nome AS tipo_transacao_nome,
	       Cliente_transacoes.valor AS transacoes_valor
	FROM cliente_transacoes
	JOIN cliente ON cliente.numero = cliente_transacoes.cliente_numero
	JOIN tipo_transacao ON tipo_transacao_id = cliente_transacoes.tipo_transacao_id
)
SELECT cliente_nome, tipo_transacao_nome, transacoes_valor
FROM clientes_e_transacoes;  --RETORNA O VALOR ERRADO
---------
WITH clientes_e_transacoes AS (
	SELECT cliente.nome AS cliente_nome,
	       tipo_transacao.nome AS tipo_transacao_nome,
	       Cliente_transacoes.valor AS transacoes_valor
	FROM cliente_transacoes
	JOIN cliente ON cliente.numero = cliente_transacoes.cliente_numero
	JOIN tipo_transacao ON tipo_transacao_id = cliente_transacoes.tipo_transacao_id
)
SELECT cliente_nome, tipo_transacao_nome, transacoes_valor
FROM clientes_e_transacoes; ----- RETORNA O VALOR ERRADO

------------------------

WITH clientes_e_transacoes AS (
	SELECT cliente.nome AS cliente_nome,
	       tipo_transacao.nome AS tipo_transacao_nome,
	       cliente_transacoes.valor AS transacoes_valor
	FROM cliente_transacoes
	JOIN cliente ON cliente.numero = cliente_transacoes.cliente_numero
	JOIN tipo_transacao ON tipo_transacao_id = cliente_transacoes.tipo_transacao_id
)
SELECT cliente_nome, tipo_transacao_nome, transacoes_valor
FROM clientes_e_transacoes; ------- RETORNA VALOR ERRADO
-----------------
WITH clientes_e_transacoes AS (
	SELECT cliente.nome AS cliente_nome,
	       tipo_transacao.nome AS tipo_transacao_nome,
	       cliente_transacoes.valor AS transacoes_valor
	FROM cliente_transacoes
	JOIN cliente ON cliente.numero = cliente_transacoes.cliente_numero
	JOIN tipo_transacao ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id
)
SELECT cliente_nome, tipo_transacao_nome, transacoes_valor
FROM clientes_e_transacoes;-------RETORNA VALOR CORRETO
-------------------------------------
-- Quary com Filtro ILIKE -------------
WITH clientes_e_transacoes AS (
	SELECT cliente.nome AS cliente_nome,
	       tipo_transacao.nome AS tipo_transacao_nome,
	       cliente_transacoes.valor AS transacoes_valor
	FROM cliente_transacoes
	JOIN cliente ON cliente.numero = cliente_transacoes.cliente_numero
	JOIN tipo_transacao ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id
	JOIN banco ON banco.numero = cliente_transacoes.banco_numero AND banco.nome ILIKE '%Itaú%'
)
SELECT cliente_nome, tipo_transacao_nome, transacoes_valor
FROM clientes_e_transacoes;--- retorna 217 rows ----- banco Itaú
-------------------------------------------------
WITH clientes_e_transacoes AS (
	SELECT cliente.nome AS cliente_nome,
	       tipo_transacao.nome AS tipo_transacao_nome,
	       cliente_transacoes.valor AS transacoes_valor
	FROM cliente_transacoes
	JOIN cliente ON cliente.numero = cliente_transacoes.cliente_numero
	JOIN tipo_transacao ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id
	JOIN banco ON banco.numero = cliente_transacoes.banco_numero AND banco.nome ILIKE '%Itaú%'
)
SELECT sum(transacoes_valor), tipo_transacao_nome
FROM clientes_e_transacoes
group by tipo_transacao_nome;--- soma do valor total por tipo de transacao ----- banco Itaú
