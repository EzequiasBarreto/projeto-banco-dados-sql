create database concessionaria_2;
use concessionaria_2;

-- Tabela "carro": 
CREATE TABLE carro (
    idcarro INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(225) NOT NULL,
    modelo VARCHAR(225),
    ano INT NOT NULL,
    cor VARCHAR(45),
    preco DECIMAL(10, 2) NOT NULL,
    numero_Chassi VARCHAR(17) NOT NULL,
    quilometragem REAL,
    tipo_combustivel VARCHAR(45)
);


-- Tabela "vendedor": 
CREATE TABLE vendedor (
    idvendedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    telefone VARCHAR(20),
    email VARCHAR(45),
    data_contratacao DATE,
    salario DECIMAL(10, 2)
);

-- Tabela "cliente": 
CREATE TABLE cliente (
    idcliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(45),
    data_registro DATE
);

-- Tabela "vendas": 
CREATE TABLE vendas (
    idvenda INT PRIMARY KEY AUTO_INCREMENT,
    idcliente INT,
    idcarro INT,
    idvendedor INT,
    data_venda DATE,
    forma_pagamento VARCHAR(45),
    status_entrega VARCHAR(45),
    FOREIGN KEY (idcliente) REFERENCES cliente(idcliente),
    FOREIGN KEY (idcarro) REFERENCES carro(idcarro),
    FOREIGN KEY (idvendedor) REFERENCES vendedor(idvendedor)
);

--------------------


  
INSERT INTO carro (marca, modelo, ano, cor, preco, numero_chassi, quilometragem, tipo_combustivel)
VALUES
    ('Toyota', 'Corolla', 2022, 'Prata', 25000.00, 'ABC123456XYZ', 15000, 'Gasolina'),
    ('Honda', 'Civic', 2021, 'Preto', 22000.00, 'DEF789012UVW', 18000, 'Gasolina'),
    ('Tesla', null, 2023, 'Vermelho', 110000.00, 'DEF789012UVW', 50, 'Elétrico'),
    ('Honda', null, 2021, 'Preto', 23000.00, 'DETTUTUTUTU', 18000, 'Gasolina'),
    ('Nissan', null, 2021, 'Prata', 22000.00, 'REW789012UVW', 18000, 'Flex'),
    ('Honda', 'Civic', 2021, 'Branco', 27000.00, 'DYUIY812UVW', 200,'Flex'),
    ('Ford', 'Focus', 2020, 'Azul', 18000.00, 'GHI234567RST', 20000, 'Diesel');

  
INSERT INTO vendedor (nome, endereco, telefone, email, data_contratacao, salario)
VALUES
    ('João','Rua A, 123', '(11) 555-1234', 'joao@email.com', '2020-01-15', 3500.00),
    ('Maria',  'Rua B, 456', '(11) 555-5678', 'maria@email.com', '2019-11-22', 3200.00),
    ('Joana',  'Rua B, 123', '(11) 555-7897', 'joana@gmail.com', '2020-01-05', 3500.00),
    ('Luis',  'Rua Y, 78', '(11) 666-7897', 'luis@gmail.com', '2010-01-01', 5500.00),
    ('David',  'Rua T, 78', '(11) 333-7897', 'davis@gmail.com', '2005-08-01', 6500.00),
    ('Carlos',  'Rua C, 789', '(11) 555-9012', 'carlos@email.com', '2021-03-05', 3800.00);

  
INSERT INTO cliente (nome, endereco, telefone, email, data_registro)
VALUES
    ('Ana', 'Av. X, 789', '(11) 555-1111', 'ana@gmail.com', '2022-02-10'),
    ('Pedro', 'Av. Y, 101', null, 'pedro@gmail.com', current_date),
    ('Suzana', 'Av. A, 22', '(11) 798-2222', 'suzana@gmail.com', '2022-05-05'),
    ('Claudia', 'Av. P, 22', '(11) 000-8888', 'claudia@gmail.com', current_date),
    ('Antonio', 'Av. R, 55', '(11) 777-3333', 'antonio@gmail.com', '2022-09-01'),
    ('Sandra', 'Av. Z, 303', '(11) 555-3333', 'sandra@gmail.com', '2022-04-25');

  
INSERT INTO vendas (idcliente, idcarro, idvendedor, data_venda, forma_pagamento, status_entrega)
VALUES
    (1, 1, 1, '2021-01-05', 'Cartão de Crédito', 'Entregue'),
    (1, 5, 3, '2021-01-05', 'Financiamento', null),
    (2, 2, 2, '2022-02-12', 'Financiamento', 'Em Processo de Entrega'),
    (2, 4, 1, '2023-02-12', 'Financiamento', null),
    (3, 3, 3, '2023-03-20', 'Pix', 'Entregue');
   

    ---------------- CRIAÇÃO DE VIEWS 

-- Q1 Criar 'vw_carros_e_vendas' para listar todos os carros e 
-- suas informações de venda (se houver), contendo: marca do carro,
-- modelo do carro, ano, cor, preco, data_venda, forma_pagamento e status_entrega. 

create view vw_carros_e_vendas as 
select c.marca, coalesce(c.modelo, 'Não tem'), c.ano,c.preco, v.data_venda, v.forma_pagamento, v.status_entrega
from carro c
left join vendas v on c.idcarro = v.idcarro;

select * from vw_carros_e_vendas;

-- Q2 Criação de 'vw_rendimento_vendedor' com campos de nome do vendedor, e-mail, somatória dos preços de carros vendidos pelo mesmo e quantidade de carros vendidos.

create view vw_rendimento_vendedor as
select vr.nome, vr.email, sum(c.preco) as soma_carros_vendidos, count(c.idcarro) as qttd_carros_vendidos
from vendedor vr
join vendas vd on vd.idvendedor = vr.idvendedor
join carro c on c.idcarro = vd.idcarro
group by vr.nome;

select * from vw_rendimento_vendedor;

-- Q3 Criação da view 'vw_vendas_detalhe' com data da venda, forma de pagamento, status da entrega, nome do vendedor, nome do cliente, preço e modelo do carro.

create view vw_vendas_detalhe as
select vendas.data_venda, vendas.forma_pagamento, vendas.status_entrega, vendedor.nome as nome_vendedor,cliente.nome as nome_cliente,carro.preco,carro.modelo
from vendas
inner join vendedor on vendedor.idvendedor = vendas.idvendedor
inner join cliente on cliente.idcliente = vendas.idcliente
inner join carro on carro.idcarro = vendas.idcarro;

select * from vw_vendas_detalhe;

-- Q4 Criação de 'vw_clientes_e_carros' trazendo nome e telefone de todos os clientes, mas também a marca do carro comprado por cada um. Caso não tenha comprado carro, escrever 'Não realizou compra' 

create view vw_clientes_e_carros as
select cliente.nome, cliente.telefone, coalesce(carro.marca, "Não realizou compra") as carro_comprado
from cliente
left join vendas on vendas.idcliente = cliente.idcliente
left join carro on vendas.idcarro = carro.idcarro;

select * from vw_clientes_e_carros;
-- Q5 Criação de view 'vw_status_entrega' trazendo nome do cliente, marca, modelo e status de entrega de todos os carros vendidos. Se o status da entrega for nulo, escrever 'Pendente'.

create view vw_status_entrega as
select cliente.nome, carro.marca, carro.modelo, coalesce(vendas.status_entrega, "Pendente") as status_entrega
from vendas
inner join cliente on vendas.idcliente = cliente.idcliente
inner join carro on vendas.idcarro = carro.idcarro;

select * from vw_status_entrega;

-- Q6 Criação de view 'vw_carros_verdes' para listagem de todos os carros, trazendo marca, modelo, preço, cor, ano e tipo combustivel. Adicionar coluna 'selo_verde' escrevendo 'SIM' caso o tipo de combustível seja elétrico e 'NÃO' para os demais.

create view vw_carros_verdes as
select carro.marca, carro.modelo, carro.preco, carro.cor, carro.ano, carro.tipo_combustivel,
  case 
    when carro.tipo_combustivel = 'Elétrico' then 'SIM'
    else 'NÃO'
  end as selo_verde
from carro;

select * from vw_carros_verdes;

-- Q7 Criação de view 'vw_vendas_recentes' com campos de data da venda, forma de pagamento, status da entrega, nome do vendedor, nome do cliente, preço e modelo do carro. Se a venda foi feita até o ano de 2022, adicionar nova coluna 'Venda Antiga', se foi após, escrever 'Venda Nova'. Não esqueça de ordenar as views para melhor entendimento.

create view vw_vendas_recentes as
select vendas.data_venda, vendas.forma_pagamento, vendas.status_entrega, vendedor.nome as nome_vendedor, cliente.nome as nome_cliente, carro.preco, carro.modelo,
  case 
    when vendas.data_venda <= '2022-12-31' then 'Venda Antiga'
    else 'Venda Nova'
  end as venda_antiga
from vendas
inner join vendedor on vendas.idvendedor = vendedor.idvendedor
inner join cliente on vendas.idcliente = cliente.idcliente
inner join carro on vendas.idcarro = carro.idcarro;

select * from vw_vendas_recentes;


-- Em resumo, a principal diferença entre INNER JOIN e LEFT JOIN é que o primeiro retorna apenas as correspondências entre as tabelas, enquanto o segundo retorna todas as linhas da tabela à esquerda, mesmo que não haja correspondência na tabela à direita. A escolha entre eles depende dos requisitos específicos da consulta que você está escrevendo.