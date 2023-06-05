USE dbLojaJailson;

BEGIN TRAN
-- select * from tb_Enderecos -- n tem nada ainda

INSERT INTO tb_Enderecos(nmEndereco, cdCidade) -- os campos que vão ser preenchidos na tabela de endereços
SELECT C.nmEndereco, CI.cdCidade -- os campos de onde vao ser puxados
FROM tb_Clientes C INNER JOIN tb_Cidades CI -- quais as tabelas que vão ser usado os dados
ON C.nmCidade = CI.nmCidade; -- qual o elo entre as tabelas

-- select * from tb_Enderecos -- preenchida a tabela

ROLLBACK TRAN;
-- COMMIT TRAN