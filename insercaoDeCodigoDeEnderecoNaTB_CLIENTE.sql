SELECT * FROM tb_Clientes;	-- antes sem os c�digos dos end = NULL
							-- depois com os c�digo dos end

BEGIN TRAN; UPDATE C SET 
C.cdEndereco = E.cdEndereco 
FROM tb_Enderecos E
INNER JOIN tb_Clientes C ON E.nmEndereco = C.nmEndereco

ROLLBACK TRAN;
-- COMMIT TRAN;
