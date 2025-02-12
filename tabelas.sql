-- create database trab3;
-- use trab3;



CREATE TABLE Clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Produtos (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2)
);

CREATE TABLE Stts (
	status_id INT PRIMARY KEY,
    stts varchar(15)
);

CREATE TABLE Estoque (
    produto_id INT PRIMARY KEY,
    quantidade INT,
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);

CREATE TABLE Pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    produto_id INT,
    status_id INT,
    qtd INT,
    data_pedido DATETIME,
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id),
    FOREIGN KEY (status_id) REFERENCES 	Stts(status_id),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);
