-- Inserir Clientes
call inserir_clientes('Ana Pereira', 'ana@example.com');
call inserir_clientes('Carlos Almeida', 'carlos@example.com');
call inserir_clientes('Beatriz Santos', 'beatriz@example.com');
call inserir_clientes('Eduardo Souza', 'eduardo@example.com');
call inserir_clientes('Fernanda Lima', 'fernanda@example.com');
call inserir_clientes('Gabriel Martins', 'gabriel@example.com');
call inserir_clientes('Isabela Costa', 'isabela@example.com');
call inserir_clientes('Júlio Rocha', 'julio@example.com');
call inserir_clientes('Karla Mendes', 'karla@example.com');
call inserir_clientes('Luiz Henrique', 'luiz@example.com');
call inserir_clientes('Mariana Silva', 'mariana@example.com');
call inserir_clientes('Natália Ribeiro', 'natalia@example.com');
call inserir_clientes('Otávio Cruz', 'otavio@example.com');
call inserir_clientes('Patrícia Barros', 'patricia@example.com');
call inserir_clientes('Ricardo Nunes', 'ricardo@example.com');
call inserir_clientes('Sofia Carvalho', 'sofia@example.com');
call inserir_clientes('Tiago Teixeira', 'tiago@example.com');
call inserir_clientes('Vanessa Lopes', 'vanessa@example.com');
call inserir_clientes('Wagner Guedes', 'wagner@example.com');
call inserir_clientes('Yasmin Fonseca', 'yasmin@example.com');

-- Inserir Produtos
call inserir_produtos('Tablet', 1200.00);
call inserir_produtos('Smartwatch', 800.00);
call inserir_produtos('Mouse', 50.00);
call inserir_produtos('Teclado', 100.00);
call inserir_produtos('Monitor', 900.00);
call inserir_produtos('Impressora', 700.00);
call inserir_produtos('Webcam', 300.00);
call inserir_produtos('Caixa de Som', 250.00);
call inserir_produtos('HD Externo', 400.00);
call inserir_produtos('Pendrive', 60.00);
call inserir_produtos('Carregador Portátil', 150.00);
call inserir_produtos('Controle de Jogos', 250.00);
call inserir_produtos('Drone', 4000.00);
call inserir_produtos('Headset Gamer', 350.00);
call inserir_produtos('Câmera DSLR', 5000.00);
call inserir_produtos('Tripé', 200.00);
call inserir_produtos('Placa de Vídeo', 2500.00);
call inserir_produtos('Fonte de Alimentação', 300.00);
call inserir_produtos('Placa Mãe', 800.00);
call inserir_produtos('Processador', 1800.00);
call inserir_produtos('Memória RAM', 600.00);
call inserir_produtos('SSD', 500.00);
call inserir_produtos('Estabilizador', 400.00);
call inserir_produtos('No-break', 800.00);
call inserir_produtos('Projetor', 3000.00);
call inserir_produtos('Mesa Digitalizadora', 1200.00);
call inserir_produtos('Hub USB', 150.00);
call inserir_produtos('Dock Station', 1000.00);
call inserir_produtos('Joystick', 300.00);
call inserir_produtos('Cooler para CPU', 150.00);

-- Inserir Estoque
call inserir_estoque(1, 10); -- Smartphone
call inserir_estoque(2, 5);  -- Laptop
call inserir_estoque(3, 15); -- Fone de Ouvido
call inserir_estoque(4, 20); -- Tablet
call inserir_estoque(5, 15); -- Smartwatch
call inserir_estoque(6, 50); -- Mouse
call inserir_estoque(7, 40); -- Teclado
call inserir_estoque(8, 25); -- Monitor
call inserir_estoque(9, 10); -- Impressora
call inserir_estoque(10, 30); -- Webcam
call inserir_estoque(11, 45); -- Caixa de Som
call inserir_estoque(12, 35); -- HD Externo
call inserir_estoque(13, 60); -- Pendrive
call inserir_estoque(14, 20); -- Carregador Portátil
call inserir_estoque(15, 10); -- Controle de Jogos
call inserir_estoque(16, 8);  -- Drone
call inserir_estoque(17, 25); -- Headset Gamer
call inserir_estoque(18, 12); -- Câmera DSLR
call inserir_estoque(19, 15); -- Tripé
call inserir_estoque(20, 30); -- Placa de Vídeo
call inserir_estoque(21, 40); -- Fonte de Alimentação
call inserir_estoque(22, 18); -- Placa Mãe
call inserir_estoque(23, 22); -- Processador
call inserir_estoque(24, 35); -- Memória RAM
call inserir_estoque(25, 28); -- SSD
call inserir_estoque(26, 10); -- Estabilizador
call inserir_estoque(27, 5);  -- No-break
call inserir_estoque(28, 12); -- Projetor
call inserir_estoque(29, 14); -- Mesa Digitalizadora
call inserir_estoque(30, 50); -- Hub USB

-- Inserir status
insert into stts values(1, 'Realizado');
insert into stts values(2, 'A caminho');
insert into stts values(3, 'Finalizado');
insert into stts values(4, 'Cancelado');

-- Inserir Pedidos
call inserir_novo_pedido(9, 5, 3, 2);
call inserir_novo_pedido(15, 4, 1, 1); 
-- erro call inserir_novo_pedido(17, 1, 3, 5);
call inserir_novo_pedido(8, 24, 2, 1);
call inserir_novo_pedido(17, 18, 1, 1);
call inserir_novo_pedido(2, 30, 2, 2);
call inserir_novo_pedido(12, 22, 1, 3);  
-- erro call inserir_novo_pedido(20, 12, 3, 6);
call inserir_novo_pedido(5, 1, 2, 2);  
call inserir_novo_pedido(11, 13, 1, 4); 


select * from pedidos;
