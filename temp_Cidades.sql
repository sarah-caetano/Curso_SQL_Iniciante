-- Migrar as Cidades para a tabela tb_Cidades
BEGIN TRAN; -- iniciar a transação
use dbLojaJailson;
CREATE TABLE #temp_Cidades(
	cdCidade INT IDENTITY (1,1),
	nmCidade VARCHAR(50),
	nmEstado VARCHAR(30),
	cdEstado INT
);
--Inserir dados dos estados na tabela temporária
INSERT INTO #temp_Cidades (nmCidade, nmEstado)
SELECT DISTINCT nmCidade, nmEstado FROM tb_Clientes;

-- Update do código do estado
UPDATE TC SET
TC.cdEstado = E.cdEstado
FROM #temp_Cidades TC INNER JOIN tb_Estados E
ON TC.nmEstado = E.nmEstado;

SET IDENTITY_INSERT tb_Cidades ON; -- insere na coluna de identity

-- Inserir os dados na tabela de Cidades
INSERT INTO tb_Cidades(cdCidade, nmCidade, cdEstado)
SELECT cdCidade, nmCidade, cdEstado FROM #temp_Cidades;

-- select * from tb_Cidades;

DROP TABLE #temp_Cidades;
SET IDENTITY_INSERT tb_Cidades OFF;
ROLLBACK TRAN;
-- COMMIT TRAN;