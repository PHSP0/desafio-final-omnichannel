Use omnichannel_db;
INSERT INTO produtos (nome, preco, estoque_atual) VALUES
('Smartphone Galaxy S23', 4500.00, 15),
('Notebook Dell Inspiron', 3800.00, 8),
('Fone de Ouvido Bluetooth', 250.00, 30);

INSERT INTO Cliente
(CPF, Nome, Email, Telefone, Data_cadastro)
VALUES
('12345678901', 'Ana Silva', 'ana@email.com', '81999990001', '2026-01-10'),
('23456789012', 'Bruno Santos', 'bruno@email.com', '81999990002', '2026-01-12'),
('34567890123', 'Carla Oliveira', 'carla@email.com', '81999990003', '2026-02-05'),
('45678901234', 'Diego Souza', 'diego@email.com', '81999990004', '2026-02-15'),
('56789012345', 'Eduarda Lima', 'eduarda@email.com', '81999990005', '2026-03-01');

INSERT INTO Lojas (Nome, Tipo, Cidade, UF)
VALUES
('Loja Recife Centro', 'Fisica', 'Recife', 'PE'),
('Loja Caruaru', 'Fisica', 'Caruaru', 'PE'),
('Loja Online', 'Virtual', 'Recife', 'PE'),
('Loja Belo Jardim', 'Fisica', 'Belo Jardim', 'PE'),
('Loja Olinda', 'Fisica', 'Olinda', 'PE');

INSERT INTO Produtos (Nome, Categoria, Preco, Estoque_atual)
VALUES
('Notebook Lenovo', 'Informatica', 3299.90, 10),
('Mouse sem fio', 'Acessorios', 89.90, 30),
('Teclado mecanico', 'Acessorios', 249.90, 15),
('Monitor 24 polegadas', 'Monitores', 899.90, 8),
('Fone Bluetooth', 'Audio', 159.90, 20);

INSERT INTO Pedidos
(Data_pedido, Id_cliente, Id_loja, Valor_total, Condicao)
VALUES
('2026-10-01', 1, 1, 3389.80, 'Concluido'),
('2026-10-02', 2, 3, 89.90, 'Concluido'),
('2026-10-03', 3, 2, 249.90, 'Concluido'),
('2026-10-04', 4, 4, 899.90, 'Concluido'),
('2026-10-05', 5, 5, 159.90, 'Concluido');

INSERT INTO Itens_pedido
(Id_pedido, Id_produto, Quantidade, Preco_unitario)
VALUES
(1, 1, 1, 3299.90),
(1, 2, 1, 89.90),
(2, 2, 1, 89.90),
(3, 3, 1, 249.90),
(4, 4, 1, 899.90);

INSERT INTO auditoria_preco
(Id_produto, Preco_antigo, Preco_novo, Data_alteracao, Usuario)
VALUES
(1, 3199.90, 3299.90, '2026-09-20', 'admin'),
(2, 79.90, 89.90, '2026-09-21', 'admin'),
(3, 229.90, 249.90, '2026-09-22', 'admin'),
(4, 849.90, 899.90, '2026-09-23', 'admin'),
(5, 149.90, 159.90, '2026-09-24', 'admin');