---------------------------------------------------------
--   Transações --------------------------
---------------------------------------------------------
SELECT nome, numero, ativo FROM banco ORDER BY numero;
----------------------------------------------------------
UPDATE banco SET ativo = false WHERE numero = 0;
----------------------------------------------------------
---- Rollback retorna ao estado que estava, no momento que o begin foi acionado.
BEGIN;
UPDATE banco SET ativo = true WHERE numero = 0;
SELECT numero, nome, ativo FROM banco WHERE numero = 0;
ROLLBACK;
-----------------------------------------------------------
--- COMMIT SALVA A MUDANÇA.
BEGIN;
UPDATE banco SET ativo = true WHERE numero = 0;
COMMIT;
-----------------------------------------------------------
---------------------------------------------------------
--   Transações --------------------------
---------------------------------------------------------
SELECT nome, numero, ativo FROM banco ORDER BY numero;
----------------------------------------------------------
UPDATE banco SET ativo = false WHERE numero = 0;
----------------------------------------------------------
---- Rollback retorna ao estado que estava, no momento que o begin foi acionado.
BEGIN;
UPDATE banco SET ativo = true WHERE numero = 0;
SELECT numero, nome, ativo FROM banco WHERE numero = 0;
ROLLBACK;
-----------------------------------------------------------
--- COMMIT SALVA A MUDANÇA.
BEGIN;
UPDATE banco SET ativo = true WHERE numero = 0;
COMMIT;
-----------------------------------------------------------

SELECT id, gerente, nome FROM funcionarios;
---------------------------------------------------
-- SAVEPOINT GUARDA AS INFORMAÇOES ADICIONADAS ENTRE BEGIN E ELA.
----------------------------------------------------
BEGIN;
UPDATE funcionarios SET gerente = 2 WHERE id = 3;
SAVEPOINT fs_func;
UPDATE funcionarios SET gerente = null;
ROLLBACK  TO fs_func;
UPDATE funcionarios SET gerente = 3 WHERE id = 5;
COMMIT;

---------------------------------------------------------
--- FUNÇÕES
---------------------------------------------------------
----- FUNÇÃO EM SQL
CREATE OR REPLACE FUNCTION func_somar (INTEGER, INTEGER)
RETURNS INTEGER
SECURITY DEFINER
RETURNS NULL ON NULL INPUT
LANGUAGE SQL 
AS $$
	SELECT $1 + $2
$$;

SELECT func_somar (1,2);
SELECT func_somar (25,null);
SELECT func_somar (215,110);
SELECT func_somar (NULL,110);


CREATE OR REPLACE FUNCTION func_somar (INTEGER, INTEGER)
RETURNS INTEGER
SECURITY DEFINER
CALLED ON NULL INPUT
LANGUAGE SQL 
AS $$
	SELECT $1 + $2
$$;

-----------------------------------------------------------
SELECT COALESCE(null, DANIEL) 
-- COALESCE RETORNA O PRIMEIRO VALOR NÃO NUMO DE UMA LISTA
-----------------------------------------------------------

CREATE OR REPLACE FUNCTION func_somar (INTEGER, INTEGER)
RETURNS INTEGER
SECURITY DEFINER
CALLED ON NULL INPUT
LANGUAGE SQL 
AS $$
	SELECT COALESCE($1,0) + COALESCE($2,0)
$$;

---------------------------------------------------------
--- FUNÇÕES
---------------------------------------------------------
----- FUNÇÃO EM SQL
CREATE OR REPLACE FUNCTION func_somar (INTEGER, INTEGER)
RETURNS INTEGER
SECURITY DEFINER
RETURNS NULL ON NULL INPUT
LANGUAGE SQL 
AS $$
	SELECT $1 + $2
$$;

SELECT func_somar (1,2);
SELECT func_somar (25,null);
SELECT func_somar (215,110);
SELECT func_somar (NULL,110);


CREATE OR REPLACE FUNCTION func_somar (INTEGER, INTEGER)
RETURNS INTEGER
SECURITY DEFINER
CALLED ON NULL INPUT
LANGUAGE SQL 
AS $$
	SELECT $1 + $2
$$;

-----------------------------------------------------------
SELECT COALESCE(null, DANIEL) 
-- COALESCE RETORNA O PRIMEIRO VALOR NÃO NUMO DE UMA LISTA
-----------------------------------------------------------

CREATE OR REPLACE FUNCTION func_somar (INTEGER, INTEGER)
RETURNS INTEGER
SECURITY DEFINER
CALLED ON NULL INPUT
LANGUAGE SQL 
AS $$
	SELECT COALESCE($1,0) + COALESCE($2,0)
$$;

-------------------------------------------------------------------
------- FUNÇÃO EM PSPGSQL

CREATE OR REPLACE FUNCTION bancos_add (p_numero INTEGER, p_nome VARCHAR, p_ativo BOOLEAN)
RETURNS INTEGER
SECURITY INVOKER
CALLED ON NULL INPUT
LANGUAGE PLPGSQL 
AS $$
DECLARE variavel_id INTEGER;
BEGIN
	IF p_numero IS null OR p_nome IS null OR p_ativo IS null THEN
		RETURN 0;
	END IF;

	SELECT INTO variavel_id numero
	FROM banco
	WHERE numero = p_numero;
	
	IF variavel_id IS null THEN
		INSERT INTO banco(numero, nome, ativo)
		VALUES (p_numero, p_nome, p_ativo);
	ELSE
		RETURN variavel_id;
	END IF;
	
	SELECT INTO variavel_id numero
	FROM banco
	WHERE numero = p_numero;
	
	RETURN variavel_id;
END; $$;

SELECT bancos_add(5433, 'Banco Novo em outra porta', true);

select * from banco where numero = 5432;

-----------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION agencias_add (p_banco_numero INTEGER, p_numero INTEGER, p_nome VARCHAR, p_ativo BOOLEAN)
RETURNS INTEGER
SECURITY INVOKER
CALLED ON NULL INPUT
LANGUAGE PLPGSQL 
AS $$
DECLARE variavel_id INTEGER;
BEGIN
	IF p_banco_numero IS null OR p_numero IS null OR p_nome IS null OR p_ativo IS null THEN
		RETURN 0;
	END IF;

	SELECT INTO variavel_id banco_numero, numero
	FROM agencia
	WHERE banco_numero = p_banco_numero AND numero = p_numero;
	
	IF variavel_id IS null THEN
		INSERT INTO agencia(banco_numero, numero, nome, ativo)
		VALUES (p_banco_numero, p_numero, p_nome, p_ativo);
	ELSE
		RETURN variavel_id;
	END IF;
	
	SELECT INTO variavel_id banco_numero, numero
	FROM agencia
	WHERE banco_numero = p_banco_numero AND numero = p_numero;
	
	RETURN variavel_id;
END; $$;

SELECT agencias_add(260, 1,'Agencia Única', true);

select * from agencia where banco_numero = 260;
select * from agencia ;

UPDATE agencia SET nome = 'Agência de São Paulo' WHERE banco_numero = 1 AND numero = 1;
