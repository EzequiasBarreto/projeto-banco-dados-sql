# Projeto de Banco de Dados SQL

Projeto desenvolvido com o objetivo de aplicar, na prática, conceitos fundamentais de **banco de dados relacional**, **modelagem de dados** e **linguagem SQL**, utilizando MySQL.

O projeto contempla desde a criação e estruturação do banco de dados até a inserção, manipulação e consulta de informações.

---

##  Objetivo

Desenvolver um banco de dados relacional aplicando conceitos essenciais de SQL e gerenciamento de dados, incluindo:

* Modelagem de banco de dados
* Criação e organização de tabelas
* Definição de relacionamentos entre tabelas
* Manipulação de dados
* Consultas e análise de informações
* Utilização de chaves primárias e estrangeiras

---

##  Tecnologias Utilizadas

* **SQL**
* **MySQL**
* **MySQL Workbench**
* **Git**
* **GitHub**

---

##  Conceitos Aplicados

Durante o desenvolvimento do projeto foram utilizados diversos conceitos fundamentais de bancos de dados:

### Modelagem

* Modelagem de dados
* Estruturação de tabelas
* Relacionamentos entre entidades
* Chaves primárias (**PRIMARY KEY**)
* Chaves estrangeiras (**FOREIGN KEY**)

### Manipulação de Dados

* `INSERT`
* `UPDATE`
* `DELETE`

### Consultas

* `SELECT`
* `WHERE`
* `ORDER BY`
* `GROUP BY`
* `JOIN`
* Funções de agregação, como:

  * `COUNT()`
  * `SUM()`
  * `AVG()`
  * `MAX()`
  * `MIN()`

---

##  Estrutura do Projeto

```text
projeto-banco-dados/
│
├── banco.sql       # Criação e configuração do banco de dados
├── tabelas.sql     # Criação das tabelas e relacionamentos
├── inserts.sql     # Inserção dos dados
└── consultas.sql   # Consultas e operações SQL
```

---

##  Como Executar o Projeto

### 1. Clone o repositório

```bash
git clone https://github.com/EzequiasBarreto/projeto-banco-dados-sql.git
```

### 2. Abra o projeto

Abra os arquivos `.sql` utilizando o **MySQL Workbench** ou outra ferramenta compatível com MySQL.

### 3. Execute os scripts

Recomenda-se executar os arquivos na seguinte ordem:

```text
1. banco.sql
2. tabelas.sql
3. inserts.sql
4. consultas.sql
```

Essa ordem garante que o banco, as tabelas e os dados sejam criados antes da execução das consultas.

---

##  Exemplos de Operações

O projeto demonstra operações como:

```sql
SELECT * FROM tabela;

UPDATE tabela
SET coluna = 'novo valor'
WHERE id = 1;

DELETE FROM tabela
WHERE id = 1;
```

Também são utilizadas consultas envolvendo **JOIN**, agrupamentos e funções de agregação para obter informações relevantes a partir dos dados armazenados.

---

##  Aprendizados

Com este projeto, foi possível desenvolver conhecimentos práticos em:

* Estruturação de bancos de dados relacionais
* Criação e gerenciamento de tabelas
* Relacionamento entre dados
* Escrita de consultas SQL
* Manipulação de registros
* Utilização de `JOIN` e funções de agregação
* Organização de scripts SQL
* Versionamento de projetos utilizando Git e GitHub

---

##  Autor

**Ezequias Barreto**

🔗 GitHub: [EzequiasBarreto](https://github.com/EzequiasBarreto)

