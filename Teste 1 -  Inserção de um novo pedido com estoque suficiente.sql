-- Inicia a transação
START TRANSACTION;

-- Teste de inserção de novo pedido (estoque suficiente)
CALL inserir_novo_pedido(1, 1, 2, 1); -- Cliente 1, Produto 1, Status 1 (Realizado), Quantidade 2

-- Verificando se o pedido foi inserido e o estoque foi atualizado
SELECT * FROM Pedidos WHERE cliente_id = 1 AND produto_id = 1;
SELECT * FROM Estoque WHERE produto_id = 1;

-- Comitando a transação
COMMIT;
