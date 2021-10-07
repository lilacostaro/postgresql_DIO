-----------------------------------------------
--Criando VIEWS
------------------------------------------------
CREATE OR REPLACE VIEW vw_bancos AS (
	SELECT numero, nome, ativo
	FROM banco 
);
------------------------------------------
SELECT numero, nome, ativo FROM vw_bancos;--- checar a criação da view
-------------------------------------------
CREATE OR REPLACE VIEW vw_bancos_2 (banco_numero, banco_nome, banco_ativo)
AS (
	SELECT numero, nome, ativo
	FROM banco
);
---------------------------------------------
SELECT banco_numero, banco_nome, banco_ativo FROM vw_bancos_2;---- checar criaçao da view
---------------------------------------------
INSERT INTO vw_bancos_2 (banco_numero, banco_nome, banco_ativo)
VALUES (0260, 'Nu Pagamentos S.A.', TRUE); ------ INSERINDO UMA NOVA ROW EM BANCOS
----------------------------------------------------
SELECT banco_numero, banco_nome, banco_ativo FROM vw_bancos_2 WHERE banco_numero = 260;-- Checando insersão na view
----------------------------------------------------
SELECT numero, nome, ativo FROM banco WHERE numero = 260;-- checando insersão na tabela
-----------------------------------------------------
UPDATE vw_bancos_2 SET banco_ativo = true WHERE banco_numero = 260; --- update row
-----------------------------------------------------
--CRIANDO VIEWS TEMPORARIAS
-----------------------------------------------------
CREATE OR REPLACE TEMPORARY VIEW vw_agencias AS (SELECT nome from agencia);
SELECT nome FROM vw_agencias;

---------------------------------------------
--CRIANDO VIEWS COM CONDIÇOES
---------------------------------------------
CREATE OR REPLACE VIEW vw_bancos_ativos AS  (
	SELECT numero, nome, ativo
	FROM banco WHERE ativo = true
) WITH LOCAL CHECK OPTION;
---------------------------------------------
INSERT INTO vw_bancos_ativos (numero, nome, ativo) VALUES (51, 'Banco Bom', false);--- tentativa de inserir valor falso da erro.
---------------------------------------------
--- view de bancos que começam com a letra a
---------------------------------------------
CREATE OR REPLACE VIEW vw_bancos_com_a AS  (
	SELECT numero, nome, ativo
	FROM vw_bancos_ativos 
	WHERE nome ILIKE 'a%'
) WITH LOCAL CHECK OPTION;
---------------------------------------------
SELECT numero, nome, ativo FROM vw_bancos_com_a; 
INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES (5214, 'Alfa Omega', true);
INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES (5216, 'Alfa Gama Omega', false);
---------------------------------------------
-- outras opcoes de check option
---------------------------------------------
CREATE OR REPLACE VIEW vw_bancos_ativos AS  (
	SELECT numero, nome, ativo
	FROM banco WHERE ativo = true
);
CREATE OR REPLACE VIEW vw_bancos_com_a AS  (
	SELECT numero, nome, ativo
	FROM vw_bancos_ativos 
	WHERE nome ILIKE 'a%'
) WITH CASCADED CHECK OPTION;

-------------------------------------------------------
--- recursive views
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS funcionarios (
	id SERIAL, 
	nome VARCHAR(50), 
	gerente INTEGER, 
	PRIMARY KEY (id),
	FOREIGN KEY (gerente) REFERENCES funcionarios (id)
);
-----------
SELECT * FROM funcionarios;
--------------
INSERT INTO funcionarios (nome, gerente) VALUES ('Ancelmo', null);
INSERT INTO funcionarios (nome, gerente) VALUES ('Beatriz', 1);
INSERT INTO funcionarios (nome, gerente) VALUES ('Magno', 1);
INSERT INTO funcionarios (nome, gerente) VALUES ('Cremilda', 2);
INSERT INTO funcionarios (nome, gerente) VALUES ('Wagner', 4);
-------------------
SELECT * FROM funcionarios;
---------------
SELECT id, nome, gerente FROM funcionarios WHERE gerente is NULL;
--------------
SELECT id, nome, gerente FROM funcionarios WHERE gerente is NULL
UNION ALL
SELECT id, nome, gerente FROM funcionarios WHERE id = 999;
------------
CREATE OR REPLACE RECURSIVE VIEW vw_func (id, gerente, funcionario) AS (
	SELECT id, gerente, nome
	FROM funcionarios
	WHERE gerente is NULL
	UNION ALL
	SELECT funcionarios.id, funcionarios.gerente, funcionarios.nome 
	FROM funcionarios
	JOIN vw_func ON vw_func.id = funcionarios.gerente
);
SELECT id, gerente, funcionario FROM vw_func;
