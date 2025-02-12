DELIMITER $$

CREATE PROCEDURE inserir_novo_pedido(cliente_id INT, produto_id INT, qtd INT, status_id INT)
BEGIN
    DECLARE estoque_atual INT;
    DECLARE msg_erro VARCHAR(255);

    -- Inicia a transação
    START TRANSACTION;

    -- Verifica o estoque disponível
    SELECT quantidade INTO estoque_atual
    FROM estoque
    WHERE produto_id = produto_id;

    -- Verifica se o estoque é suficiente
    IF estoque_atual IS NULL THEN
        SET msg_erro = CONCAT('Erro: Produto com ID ', produto_id, ' não encontrado no estoque.');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg_erro;
    END IF;

    IF estoque_atual < qtd THEN
        SET msg_erro = CONCAT('Erro: Estoque insuficiente para o produto ', produto_id, '.');
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg_erro;
    ELSE
        -- Insere o pedido
        INSERT INTO pedidos (cliente_id, produto_id, status_id, data_pedido, qtd)
        VALUES (cliente_id, produto_id, status_id, NOW(), qtd);

        -- Atualiza o estoque
        UPDATE estoque
        SET quantidade = quantidade - qtd
        WHERE produto_id = produto_id;

        -- Confirma a transação
        COMMIT;
    END IF;
END$$

DELIMITER ;
