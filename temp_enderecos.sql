USE dbLojaJailson;

BEGIN TRAN
-- select * from tb_Enderecos -- n tem nada ainda

INSERT INTO tb_Enderecos(nmEndereco, cdCidade) -- os campos que v�o ser preenchidos na tabela de endere�os
SELECT C.nmEndereco, CI.cdCidade -- os campos de onde vao ser puxados
FROM tb_Clientes C INNER JOIN tb_Cidades CI -- quais as tabelas que v�o ser usado os dados
ON C.nmCidade = CI.nmCidade; -- qual o elo entre as tabelas

-- select * from tb_Enderecos -- preenchida a tabela

ROLLBACK TRAN;
-- COMMIT TRAN