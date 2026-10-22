Create database omnichannel_db;
Use omnichannel_db;

create table Cliente(
CPF VARCHAR(11) NOT NULL UNIQUE,
Id_cliente INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(100) NOT NULL,
Email VARCHAR(50) NOT NULL,
Telefone varchar(20),
Data_cadastro DATE
);

Create Table Lojas(
Id_loja INT PRIMARY KEY AUTO_INCREMENT,
Nome Varchar(100) not null,
Tipo Varchar (50) Not null,
Cidade Varchar (50) NOT NULL,
UF Varchar(2) NOT NULL);

CREATE TABLE Pedidos (
    Id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    Data_pedido DATE,
    Id_cliente INT,
    Id_loja INT,
    Valor_total DECIMAL(10,2),
    Condicao VARCHAR(50),
    FOREIGN KEY (Id_cliente) REFERENCES Cliente(Id_cliente),
    FOREIGN KEY (Id_loja) REFERENCES Lojas(Id_loja)
);

Create Table Produtos(
Id_produto int auto_increment primary key,
Nome varchar(100),
Categoria Varchar(50),
Preco Decimal(10,2),
Estoque_atual INT(50)
);

CREATE TABLE Itens_pedido (
Id_item INT PRIMARY KEY AUTO_INCREMENT,
Id_pedido INT NOT NULL,
Id_produto INT NOT NULL,
Quantidade INT NOT NULL,
Preco_unitario DECIMAL(10,2) NOT NULL,
FOREIGN KEY (Id_pedido) REFERENCES Pedidos(Id_pedido),
FOREIGN KEY (Id_produto) REFERENCES Produtos(Id_produto)
);

Create Table auditoria_preco(
Id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
Id_produto INT NOT NULL,
FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto),
Preco_antigo DECIMAL(10,2),
Preco_novo DECIMAL(10,2),
Data_alteracao DATE,
Usuario VARCHAR (50)
);