delimiter $$
create procedure inserir_clientes(n varchar(100), mail varchar(100))
begin
insert into clientes(nome, email) values(n,mail);
end$$
delimiter ;

delimiter $$
create procedure inserir_produtos(n varchar(100), p decimal(10,2))
begin
	insert into produtos(nome, preco) values (n, p);
end $$ 
delimiter ;


delimiter $$
create procedure inserir_estoque(id int, qtd int)
begin
insert into estoque(produto_id, quantidade) values(id, qtd);
end$$
delimiter ;



DELIMITER $$

CREATE PROCEDURE inserir_novo_pedido(cliente_id INT, produto_id_param INT, qtd INT, status_id INT)
BEGIN
    DECLARE estoque_atual INT;
    DECLARE msg_erro VARCHAR(255);

    -- Inicia a transação
    START TRANSACTION;

    -- Verifica o estoque disponível
    SELECT quantidade INTO estoque_atual
    FROM estoque
    WHERE produto_id = produto_id_param;  -- Usando produto_id_param para diferenciar

    -- Verifica se o estoque é suficiente
    IF estoque_atual IS NULL THEN
        SET msg_erro = CONCAT('Erro: Produto com ID ', produto_id_param, ' não encontrado no estoque.');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg_erro;
    END IF;

    IF estoque_atual < qtd THEN
        SET msg_erro = CONCAT('Erro: Estoque insuficiente para o produto ', produto_id_param, '.');
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg_erro;
    ELSE
        -- Insere o pedido
        INSERT INTO pedidos (cliente_id, produto_id, status_id, data_pedido, qtd)
        VALUES (cliente_id, produto_id_param, status_id, NOW(), qtd);

        -- Atualiza o estoque
        UPDATE estoque
        SET quantidade = quantidade - qtd
        WHERE produto_id = produto_id_param;

        -- Confirma a transação
        COMMIT;
    END IF;
END$$

DELIMITER ;
