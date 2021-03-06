# Inserção de dados na Tabela 'banco'

INSERT INTO banco(numero, nome, ativo, data_criacao) VALUES(0001, 'BCO BRASIL S.A.', TRUE, now());
INSERT INTO banco(numero, nome, ativo, data_criacao) VALUES(0237, 'BCO BRADESCO S.A.', TRUE, now());
INSERT INTO banco(numero, nome, ativo, data_criacao) VALUES(0336, 'BCO C6 S.A.', TRUE, now());
INSERT INTO banco(numero, nome, ativo, data_criacao) VALUES(0077, 'BANCO INTER', TRUE, now());
INSERT INTO banco(numero, nome, ativo, data_criacao) VALUES(0104, 'CAIXA ECONOMICA FEDERAL', TRUE, now());
INSERT INTO banco(numero, nome, ativo, data_criacao) VALUES(0184, 'BCO ITAU BBA S.A.', TRUE, now());
INSERT INTO banco(numero, nome, ativo, data_criacao) VALUES(0033, 'BCO SANTANDER BRASIL S.A.', TRUE, now());
INSERT INTO banco(numero, nome, ativo, data_criacao) VALUES(0260, 'NU PAGAMENTOS S.A.', TRUE, now());

# Inseção de dados na Tabela 'agencia'

INSERT INTO agencia (banco_numero, numero, nome) VALUES (0001,0001,'Agência número 1 do Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0001,0002,'Agência número 2 do Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0001,0003,'Agência número 3 do Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0001,0004,'Agência número 4 do Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0001,0005,'Agência número 5 do Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0001,0006,'Agência número 6 do Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0001,0007,'Agência número 7 do Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0001,0008,'Agência número 8 do Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0001,0009,'Agência número 9 do Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0001,0010,'Agência número 10 do Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0237,0001,'Agência número 1 do Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0237,0002,'Agência número 2 do Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0237,0003,'Agência número 3 do Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0237,0004,'Agência número 4 do Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0237,0005,'Agência número 5 do Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0237,0006,'Agência número 6 do Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0237,0007,'Agência número 7 do Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0237,0008,'Agência número 8 do Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0237,0009,'Agência número 9 do Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0237,0010,'Agência número 10 do Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0336,0001,'Agência número 1 do Banco C6 S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0336,0002,'Agência número 2 do Banco C6 S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0336,0003,'Agência número 3 do Banco C6 S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0336,0004,'Agência número 4 do Banco C6 S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0336,0005,'Agência número 5 do Banco C6 S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0336,0006,'Agência número 6 do Banco C6 S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0336,0007,'Agência número 7 do Banco C6 S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0336,0008,'Agência número 8 do Banco C6 S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0336,0009,'Agência número 9 do Banco C6 S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0336,0010,'Agência número 10 do Banco C6 S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0077,0001,'Agência número 1 do Banco Inter');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0104,0001,'Agência número 1 da Caixa Economica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0104,0002,'Agência número 2 da Caixa Economica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0104,0003,'Agência número 3 da Caixa Economica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0104,0004,'Agência número 4 da Caixa Economica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0104,0005,'Agência número 5 da Caixa Economica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0104,0006,'Agência número 6 da Caixa Economica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0104,0007,'Agência número 7 da Caixa Economica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0104,0008,'Agência número 8 da Caixa Economica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0104,0009,'Agência número 9 da Caixa Economica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0104,0010,'Agência número 10 da Caixa Economica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0184,0001,'Agência número 1 do Banco Itaú BBA S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0184,0002,'Agência número 2 do Banco Itaú BBA S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0184,0003,'Agência número 3 do Banco Itaú BBA S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0184,0004,'Agência número 4 do Banco Itaú BBA S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0184,0005,'Agência número 5 do Banco Itaú BBA S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0184,0006,'Agência número 6 do Banco Itaú BBA S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0184,0007,'Agência número 7 do Banco Itaú BBA S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0184,0008,'Agência número 8 do Banco Itaú BBA S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0184,0009,'Agência número 9 do Banco Itaú BBA S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0184,0010,'Agência número 10 do Banco Itaú BBA S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0033,0001,'Agência número 1 do Banco Santander do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0033,0002,'Agência número 2 do Banco Santander do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0033,0003,'Agência número 4 do Banco Santander do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0033,0004,'Agência número 4 do Banco Santander do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0033,0005,'Agência número 5 do Banco Santander do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0033,0006,'Agência número 6 do Banco Santander do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0033,0007,'Agência número 7 do Banco Santander do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0033,0008,'Agência número 8 do Banco Santander do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0033,0009,'Agência número 9 do Banco Santander do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0033,0010,'Agência número 10 do Banco Santander do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (0260,0001,'Agência número 1 do Nu Pagamentos S.A.');
