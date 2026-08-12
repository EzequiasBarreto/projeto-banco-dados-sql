create database db_barreto;
use db_barreto;

create table clientes(
id_cliente int primary key auto_increment,
nome varchar(100) not null,
email varchar(100),
cpf int
);

drop table clientes;

create table pedidos(
id_pedidos int primary key,
data_pedido date,
valor_total decimal,
id_cliente int,
foreign key (id_cliente) references clientes(id_cliente)
);

-- select * from clientes;

-- Alteração na tabela cliente
alter table clientes
add column telefone varchar(20) after cpf;

-- Exclusão de tabela
drop table pedidos;

-- DML: INSERIR REGISTROS 
select * from clientes;
insert into clientes(nome, email, cpf, telefone)
values('joao','j@gmail.com',123458912,'71 987445566'),
('master','master@uol.com',789456123,'77 984579584'),
('master5','master5@bol.com',786486563,'73 965579584'),
('Acer', 'acer@gmail.com',55485755,'');


-- fazendo atualização de registros em uma tabela 
update clientes
set nome = 'Carlos', email = 'carl@iuo.com'
where id_cliente = 3;

-- WHERE utiliza o operador LIKE e o caractere curinga % para buscar todos os registros que tenham o valor do e-mail terminando em @gmail.com.
update clientes
set email = 'acer@gmail.com'
where email like '%@gmail.com'; 

delete from clientes
where telefone is null;



select * from pedidos;
insert into pedidos(id_pedidos, data_pedido, valor_total, id_cliente)
values (1, '2000-05-12', 8000.00, 1),
(2, '2023-08-27', 5621.00, 2), 
(3, '2023-07-30', 2300.00, 3);

delete from pedidos
where id_pedidos = 1;

-- delete from pedidos; 

-- delete from clientes;











