-- INSERT INTO tb_Clientes VALUES('Sarah', '2000-10-23', 'F', 'CCSW 4, Lote 4, Bloco B', 'Sudoeste', 'Distrito Federal', '61999285508','61998538255');
-- INSERT INTO tb_Clientes VALUES('Lucas', '2003-10-30', 'M', 'Rua Modesto de Melo', 'Formosa', 'Goiás', '309141','4322112');
-- INSERT INTO tb_Clientes VALUES('Luciano', '2002-08-17', 'M', 'Rua do Céu', 'Anápolis', 'Goiás', '32113','090909');
-- INSERT INTO tb_Clientes VALUES('Teresa', '1966-10-21', 'F', 'Rua Modesto de Melo', 'Formosa', 'Goiás', '92837093','874013824');
-- INSERT INTO tb_Clientes VALUES('Caetano', '1966-04-15', 'M', 'Rua Modesto de Melo', 'Formosa', 'Goiás', '83221','80983431');
-- select * from tb_Clientes;

SELECT *
INTO tb_ClientesBackup
FROM tb_Clientes;