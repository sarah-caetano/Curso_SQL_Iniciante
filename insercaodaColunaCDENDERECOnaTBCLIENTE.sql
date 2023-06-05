use dbLojaJailson;

SELECT * FROM tb_Clientes; -- criacao da coluna de cdEndereco na tb_Clientes

BEGIN TRAN	
ALTER TABLE tb_Clientes
ADD cdEndereco INT NULL; -- coluna tem só null

ALTER TABLE tb_Clientes
ADD CONSTRAINT FK_Clientes_Enderecos -- "chave secundaria" = constraint
FOREIGN KEY (cdEndereco)
REFERENCES tb_Enderecos(cdEndereco);

ROLLBACK TRAN;
-- COMMIT TRAN;