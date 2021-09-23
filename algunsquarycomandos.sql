SELECT numero, nome, ativo FROM banco;
SELECT banco_numero, numero, nome FROM agencia;
SELECT numero, nome, email FROM cliente;
SELECT banco_numero, agencia_numero, numero, cliente_numero FROM conta_corrente;
SELECT id, nome FROM tipo_transacao;
SELECT banco_numero, agencia_numero, cliente_numero, valor FROM cliente_transacoes;

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

INSERT INTO teste (cpf, nome, created_at) VALUES (02418475942, 'Camila Costa', now());

INSERT INTO teste (cpf, nome, created_at) VALUES (02418475942, 'Camila Costa', now()) ON CONFLICT (cpf) DO NOTHING;

UPDATE teste SET nome='Camila Rodrigues Costa' WHERE cpf = '2418475942';

SELECT * FROM teste;
DROP TABLE teste;

SELECT * FROM conta_corrente;

SELECT * FROM information_schema.columns WHERE table_name = 'banco';
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'banco';
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'agencia';
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'cliente';
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'cliente_transacoes';
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'conta_corrente';
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'tipo_transacao';

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

--Group by function

SELECT MAX(valor), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id;

SELECT MIN(valor), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id;

SELECT COUNT(id), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id;

SELECT COUNT(id), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id HAVING COUNT(id) > 150 and COUNT(id) < 800;

--SUM

SELECT SUM(valor) FROM cliente_transacoes;

SELECT SUM(valor), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id;

--order by

SELECT SUM(valor), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id ORDER BY tipo_transacao_id ASC;

SELECT SUM(valor), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id ORDER BY tipo_transacao_id DESC;
