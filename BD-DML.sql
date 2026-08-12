create database db_biblioteca;
use db_biblioteca;

create table autor(
id_autor int primary key auto_increment,
nome varchar(100) not null,
nacionalidade varchar(50),
data_nascimento date
);

-- select * from autor;

create table editora (
id_editora int primary key auto_increment,
nome varchar(100) not null,
endereco varchar(200),
telefone varchar(20)
);

create table livro (
id_livro int primary key auto_increment,
titulo varchar(200) not null,
ano_publicacao year,
id_editora int,
id_autor_principal int,
foreign key(id_editora) references editora(id_editora),
foreign key(id_autor_principal) references autor(id_autor)
);

-- alterar o nome da tabela "editora" para "nova_editora".
alter table nova_editora
rename to editora;

-- alterar o tipo da coluna "telefone" de varchar(20) para varchar(30).
alter table editora
modify column telefone varchar(30);

-- acrescentar uma nova coluna chamada "email" do tipo varchar(100).
-- após a coluna "endereco"
alter table editora
add column email varchar(100) after endereco;

-- excluir a coluna "endereco" da tabela.
alter table editora
drop column endereco;

-- criar a coluna "endereco" da tabela.
alter table editora
add column endereco varchar(100) after telefone;

select * from editora;
insert into editora (nome, email, telefone, endereco)
values('Abril','abril@gmail.com','71 36278077','av industrial urbano - 294');


select * from autor;
insert into autor (nome, nacionalidade, data_nascimento)
values('BARRETO','Frances','1992-02-15'),
('Login','Coreano','1998-02-25'),
('Daten','holandes','2000-08-15');


select * from livro;
insert into livro (titulo, ano_publicacao, id_editora,id_autor_principal)
values('Vida da Ti',2023, 1, 2),
('Policarpio Quaresma',1960, 1, 3),
('Monge e o Executivo',1983, 1, 4);


alter table departamentos
add column descricao varchar(50) after nome_departamento;

alter table departamentos
rename column nome_departamento to nome_setor;

alter table departamentos
drop column descricao;

alter table funcionarios
modify column salarios decimal(12, 2);





