CREATE TABLE tb_Produtos( -- cada linha é uma coluna
	cdProduto INT PRIMARY KEY IDENTITY(1,1), -- Código do Produto -> COMEÇA EM 1, AUMENTA DE 1 EM 1
	nmProduto VARCHAR(50) NOT NULL, -- Obrigatorio /*nome de produto com número máximo de caracteres de 50*/
	vlProduto DECIMAL(6, 2) NOT NULL
);
CREATE TABLE tb_Clientes(
	cdCliente INT PRIMARY KEY IDENTITY(1,1), -- Código do Cliente
	nmCliente VARCHAR(50) NOT NULL,
	dtNascimento DATE,
	inSexo VARCHAR(1) NOT NULL,
	nmEndereco VARCHAR(50),
	nmCidade VARCHAR(50),
	nmEstado VARCHAR(30),
	nmTelefone1 VARCHAR(15),
	nmTelefone2 VARCHAR(15)
);

CREATE TABLE tb_ProdutoVenda(
	cdProdutoVenda INT PRIMARY KEY IDENTITY(1,1),
	cdVenda INT FOREIGN KEY REFERENCES tb_Vendas(cdVenda) NOT NULL,
	cdProduto INT FOREIGN KEY REFERENCES tb_Produtos(cdProduto) NOT NULL,
	qtProduto INT NOT NULL
);

CREATE TABLE tb_Vendas(
	cdVenda INT PRIMARY KEY IDENTITY(1,1),
	cdCliente INT NOT NULL FOREIGN KEY REFERENCES tb_Clientes (cdCliente),
	dtVenda DATETIME NOT NULL
);

-- FOREIGN KEY -> chave secundária -> só ter vendas de produtos cadastrados
-- CONSTRAINT (regra)
ALTER TABLE tb_Vendas
ADD CONSTRAINT FK_Produtos_Vendas
FOREIGN KEY (cdProduto)
REFERENCES tb_Produtos(cdProduto)

-- Remover a tabela de vendas
DROP TABLE tb_Vendas
DROP TABLE tb_Clientes
DROP TABLE tb_ProdutoVenda
