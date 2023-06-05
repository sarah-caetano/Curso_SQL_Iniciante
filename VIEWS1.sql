CREATE VIEW vw_Endereco_Completo_Clientes
AS
SELECT 
	CL.cdCliente, 
	CL.nmCliente, 
	CL.dtNascimento, 
	CL.inSexo,
	EN.cdEndereco,
	EN.nmEndereco,
	EN.nmCEP,
	CI.cdCidade,
	CI.nmCidade,
	ES.cdEstado,
	ES.nmEstado,
	ES.nmSigla
FROM tb_Clientes CL INNER JOIN tb_Enderecos EN ON CL.cdEndereco = EN.cdEndereco
					INNER JOIN tb_Cidades CI ON EN.cdCidade = CI.cdCidade
					INNER JOIN tb_Estados ES ON CI.cdCidade = ES.cdEstado;

-- SELECT * FROM vw_Endereco_Completo_Clientes