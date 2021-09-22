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
