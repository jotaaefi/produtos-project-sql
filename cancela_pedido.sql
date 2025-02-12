DELIMITER $$

CREATE PROCEDURE cancelar_pedido(IN pedido_id_param INT)
BEGIN
    DECLARE produto_id INT;
    DECLARE qtd INT;
    DECLARE status_atual INT;

    -- Iniciar transação
    START TRANSACTION;

    -- Obter informações do pedido
    SELECT produto_id, qtd, status_id INTO produto_id, qtd, status_atual
    FROM pedidos
    WHERE pedido_id = pedido_id_param
    LIMIT 1;

    -- Verificar se o pedido já foi finalizado ou enviado
    IF status_atual = 3 OR status_atual = 2 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'O pedido já foi enviado ou finalizado e não pode ser devolvido';
    ELSE
        -- Atualizar estoque
        UPDATE estoque
        SET quantidade = quantidade + qtd
        WHERE produto_id = produto_id;

        -- Atualizar status do pedido para "Cancelado" 
        UPDATE pedidos
        SET status_id = 4
        WHERE pedido_id = pedido_id_param;

        -- Confirmar transação
        COMMIT;
    END IF;
END$$

DELIMITER ;

CALL cancelar_pedido(8);  

select * from pedidos;