DELIMITER //

CREATE TRIGGER aplicar_desconto
AFTER INSERT ON Pedidos
FOR EACH ROW
BEGIN
    DECLARE preco_unitario DECIMAL(10, 2);

    -- Pega o preço unitário da tabela Produtos
    SELECT preco INTO preco_unitario
    FROM Produtos
    WHERE produto_id = NEW.produto_id;

    -- Atualiza o campo total na tabela Pedidos com o preço com desconto
    UPDATE Pedidos
    SET total = NEW.qtd * preco_unitario * 0.9
    WHERE pedido_id = NEW.pedido_id;

END //

DELIMITER ;