-- DROP TABLE tb_ClientesBackup;
-- use dbLojaJailson
/*CREATE TABLE tb_Clientes_Hist(
	cd_Clientes_Hist INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
	cdCliente INT NOT NULL,
	nmCliente VARCHAR(50) NOT NULL,
	dtNascimento DATE NOT NULL,
	inSexo VARCHAR(1) NOT NULL,
	cdEndereco INT NULL,
	dtInclusao DATETIME
);*/
-- drop table tb_Clientes_Hist
CREATE TRIGGER tr_Backup_Clientes -- deve ser o primeiro comando da consulta
ON tb_Clientes
FOR UPDATE
AS
	INSERT tb_Clientes_Hist(cdCliente, nmCliente, dtNascimento, inSexo, cdEndereco, dtInclusao)
	SELECT cdCliente, nmCliente, dtNascimento, inSexo, cdEndereco, GETDATE() FROM deleted; 

-- colocar informações na tabela Clientes_Hist
BEGIN TRAN;
UPDATE tb_Clientes SET nmCliente = 'Sarah Linda' WHERE cdCliente = 1;
SELECT * FROM tb_Clientes_Hist
SELECT * FROM tb_Clientes

COMMIT TRAN;