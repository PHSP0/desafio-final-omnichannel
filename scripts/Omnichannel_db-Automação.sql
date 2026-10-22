
USE omnichannel_db;

DROP PROCEDURE IF EXISTS sp_registrar_venda;

DELIMITER //

CREATE PROCEDURE sp_registrar_venda(
IN p_id_cliente INT,
IN p_id_loja INT,
IN p_origem_compra VARCHAR(30),
IN p_forma_pagamento VARCHAR(30),
IN p_id_produto INT,
IN p_quantidade INT
)
BEGIN
DECLARE v_estoque INT;
DECLARE v_preco DECIMAL(10,2);
DECLARE v_id_pedido INT;
DECLARE v_total DECIMAL(10,2);
    
IF p_quantidade <= 0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'A quantidade deve ser maior que zero';
END IF;

SELECT Estoque_atual, Preco
INTO v_estoque, v_preco
FROM Produtos
WHERE Id_produto = p_id_produto
FOR UPDATE;

IF v_estoque < p_quantidade THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Estoque insuficiente';
END IF;

SET v_total = v_preco * p_quantidade;

INSERT INTO Pedidos
(Data_pedido, Id_cliente, Id_loja, Valor_total, Condicao)
VALUES
(NOW(), p_id_cliente, p_id_loja, v_total, 'Concluido');

SET v_id_pedido = LAST_INSERT_ID();

INSERT INTO Itens_pedido
(Id_pedido, Id_produto, Quantidade, Preco_unitario)
VALUES
(v_id_pedido, p_id_produto, p_quantidade, v_preco);

UPDATE Produtos
SET Estoque_atual = Estoque_atual - p_quantidade
WHERE Id_produto = p_id_produto;

IF v_estoque - p_quantidade < 5 THEN
SELECT CONCAT(
'ATENCAO: estoque baixo. Restam ',
v_estoque - p_quantidade,
' unidades.'
) AS Alerta;
    END IF;

SELECT v_id_pedido AS Id_pedido_criado,
	v_total AS Valor_total;
END //

DELIMITER ;

DROP TRIGGER IF EXISTS trg_auditoria_preco;

DELIMITER //

CREATE TRIGGER trg_auditoria_preco
AFTER UPDATE ON Produtos
FOR EACH ROW
BEGIN
IF OLD.Preco <> NEW.Preco THEN
INSERT INTO auditoria_preco
(Id_produto, Preco_antigo, Preco_novo,
Data_alteracao, Usuario)
VALUES
(OLD.Id_produto, OLD.Preco, NEW.Preco,
NOW(), USER());
    END IF;
END //

DELIMITER ;
