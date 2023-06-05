-- Inserção nas tabelas

INSERT INTO tb_Produtos VALUES('Suco de Laranja', 2.5);
-- com os nomes das colunas:
INSERT INTO tb_Produtos (vlProduto, nmProduto) VALUES (4.5, 'Suco de Manga'); -- note a ordem invertida dos dados
INSERT INTO tb_Produtos VALUES('Suco de Lixia', 5.50);

-- TESTANDO O CONSTRAINT
INSERT INTO  tb_Vendas VALUES(3, 3.2);