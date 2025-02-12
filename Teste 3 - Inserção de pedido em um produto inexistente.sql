-- Teste 3 - Inserção de pedido em um produto inexistente

-- Inicia a transação
START TRANSACTION;

-- Teste de tentativa de inserção de pedido com produto inexistente
CALL inserir_novo_pedido(3, 999, 2, 1); -- Cliente 3, Produto 999 (não existe), Status 2 (A caminho), Quantidade 2

-- Espera-se que gere erro devido ao produto não existir no estoque
SELECT * FROM Pedidos WHERE cliente_id = 3 AND produto_id = 999;
SELECT * FROM Estoque WHERE produto_id = 999;

-- Comitando a transação (não deve ser executado devido ao erro)
COMMIT;
