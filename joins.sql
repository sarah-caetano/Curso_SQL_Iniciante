CREATE PROCEDURE sp_TotalVendasProdutosCliente( -- função! -- sp: storage procedure
	@cdCliente INT
)

AS

-- Seleção dos dados com valores
SELECT V.cdVenda, C.nmCliente, P.cdProduto, P.nmProduto, PV.qtProduto, P.vlProduto, qtProduto*vlProduto AS 'ValorTotal', TOTAL_VENDAS.qtTotalProdutos, TOTAL_VENDAS.ValorTotalVenda
FROM tb_Produtos P INNER JOIN tb_ProdutoVenda PV ON P.cdProduto = PV.cdProduto -- ON = condição pro inner join
INNER JOIN tb_Vendas V ON PV.cdVenda = V.cdVenda
INNER JOIN tb_Clientes C ON V.cdCliente = C.cdCliente
INNER JOIN(
	-- Soma dos valores - agrupamentos
	SELECT V.cdVenda, SUM(PV.qtProduto) qtTotalProdutos, SUM(P.vlProduto *PV.qtProduto) AS ValorTotalVenda
	FROM tb_Produtos P INNER JOIN tb_ProdutoVenda PV ON P.cdProduto = PV.cdProduto 
	INNER JOIN tb_Vendas V ON PV.cdVenda = V.cdVenda
	GROUP BY V.cdVenda
) TOTAL_VENDAS ON V.cdVenda = TOTAL_VENDAS.cdVenda
WHERE V.cdCliente = @cdCliente

-- sp_TotalVendasProdutosCliente 1