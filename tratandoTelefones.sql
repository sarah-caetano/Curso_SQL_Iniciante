-- criando a tabela de telefones (1 telefone para cada cliente pela chave)
CREATE TABLE tb_TelefoneCliente(
	cdTelefone INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
	cdCliente INT NOT NULL,
	nmTelefone VARCHAR(15) NOT NULL,
	inAtivoSN VARCHAR(1) NOT NULL DEFAULT 'S' -- se o telefone tá ativo ou n
);
-- Criando a chave que liga as duas tabelas
ALTER TABLE tb_TelefoneCliente
ADD CONSTRAINT FK_TelefoneCliente_Clientes
FOREIGN KEY(cdCliente) REFERENCES tb_Clientes(cdCliente);

-- inserindo os dados da tabela clientes na tabela de telefones
-- BEGIN TRAN
INSERT INTO tb_TelefoneCliente (cdCliente, nmTelefone) -- em qual tabela inserir (em qual coluna)
SELECT cdCliente, nmTelefone1 FROM tb_Clientes -- selecionar qual coluna de qual tabela

INSERT INTO tb_TelefoneCliente (cdCliente, nmTelefone) SELECT cdCliente, nmTelefone2 FROM tb_Clientes -- as duas linhas acima em uma

-- COMMIT TRAN;
-- select * from tb_TelefoneCliente
-- BEGIN TRAN 
ALTER TABLE tb_Clientes DROP COLUMN nmTelefone1, nmTelefone2; -- tirar as colunas de telefone de tb_Clientes
SELECT * FROM tb_Clientes
	 