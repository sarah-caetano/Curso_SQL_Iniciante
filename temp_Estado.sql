-- Iniciar a transação
BEGIN TRAN

CREATE TABLE #temp_Estados(
	cdEstado INT IDENTITY (1,1),
	nmEstado VARCHAR(30),
	nmSigla VARCHAR(2)
);
-- SELECT * from #temp_Estados
-- SELECT * from tb_Estados
--Inserir dados dos estados na tabela temporária
INSERT INTO #temp_Estados (nmEstado)
SELECT DISTINCT nmEstado FROM tb_Clientes -- pegar so o nome do estado

UPDATE #temp_Estados SET nmSigla = 'DF' WHERE nmEstado = 'Distrito Federal';
UPDATE #temp_Estados SET nmSigla = 'GO' WHERE nmEstado = 'Goiás';

SET IDENTITY_INSERT tb_Estados ON; -- insere na coluna de identity

-- Inserindo na tabela de Estados
INSERT INTO tb_Estados (cdEstado, nmEstado, nmSigla)
SELECT cdEstado, nmEstado, nmSigla FROM #temp_Estados;

DROP TABLE #temp_Estados;
SET IDENTITY_INSERT tb_Estados OFF;
ROLLBACK TRAN; -- salva vidas! tudo que fez depois do BEGIN TRAN ele refaz
-- COMMIT TRAN;
