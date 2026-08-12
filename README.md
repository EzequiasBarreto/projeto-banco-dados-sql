# Projetos de Banco de Dados SQL
Este repositório reúne uma coleção de scripts SQL (MySQL) desenvolvidos como prática de modelagem, manipulação e consulta de bancos de dados relacionais. Os exercícios cobrem desde a criação de tabelas (DDL) até comandos de manipulação de dados (DML), views e triggers.

## 📁 Estrutura do projeto
```
sql-database-projects/
├── BD-Concessionaria.sql   # Banco de dados de uma concessionária de veículos
├── BD-DML.sql              # Banco de dados de uma biblioteca (autores, editoras, livros)
├── db_barreto.sql          # Banco de dados de clientes e pedidos
└── triggers.sql            # Exemplos de triggers no MySQL
```
## 📄 Descrição dos scripts
`BD-Concessionaria.sql`
Modelagem completa de uma concessionária de veículos, contendo:
Tabelas: `carro`, `vendedor`, `cliente`, `vendas`
Inserção de dados de exemplo
Criação de 7 views para relatórios de negócio, como:
`vw_carros_e_vendas` — carros e suas respectivas vendas
`vw_rendimento_vendedor` — desempenho de vendas por vendedor
`vw_vendas_detalhe` — detalhamento completo de cada venda
`vw_clientes_e_carros` — clientes e os carros comprados
`vw_status_entrega` — status de entrega das vendas
`vw_carros_verdes` — identificação de carros elétricos
`vw_vendas_recentes` — classificação de vendas antigas x recentes
`BD-DML.sql`

Banco de dados de uma biblioteca (`db_biblioteca`), com as tabelas `autor`, `editora` e `livro`. Traz exemplos de comandos `ALTER TABLE` (renomear tabela/coluna, adicionar e remover colunas, alterar tipos) e `INSERT`.
`db_barreto.sql`

Banco de dados simples de clientes e pedidos (`db_barreto`), demonstrando os comandos básicos de DML: `INSERT`, `UPDATE`, `DELETE` e uso de `LIKE`/curinga em filtros.
`triggers.sql`
Exemplo prático de trigger no MySQL (`tutorial_triggers`): ao inserir um novo pedido na tabela `pedidos`, a trigger `atualiza_data_ultimo_pedido` atualiza automaticamente a data do último pedido na tabela `clientes`.

## 🛠️ Tecnologias
MySQL (compatível com MySQL 5.7+/8.0)

## ▶️ Como executar
Abra o MySQL Workbench, DBeaver, linha de comando ou outro cliente de sua preferência.
Execute o script desejado. Cada arquivo já contém o comando `CREATE DATABASE` e `USE`, então basta rodar o arquivo inteiro:
```bash
mysql -u seu_usuario -p < BD-Concessionaria.sql
```
> ⚠️ Alguns scripts (`BD-DML.sql`, `db_barreto.sql`) contêm comandos `ALTER TABLE`/`DROP TABLE` pensados como exercício sequencial de aula — recomenda-se ler o script antes de executar tudo de uma vez, pois algumas instruções dependem de passos anteriores já terem sido aplicados.

## 🎯 Objetivo
Projeto de estudos com foco em:
Modelagem de dados relacional (DDL)
Relacionamentos entre tabelas (chaves primárias e estrangeiras)
Manipulação de dados (DML)
Criação de views para consultas de negócio
Automatização com triggers

## 📌 Autor
*Ezequias Barreto* - Desenvolvido como parte de estudos práticos em banco de dados SQL.

## 📃 Licença
Este projeto é de uso livre para fins de estudo.
