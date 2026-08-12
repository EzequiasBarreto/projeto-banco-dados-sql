CREATE DATABASE tutorial_triggers;
USE tutorial_triggers;

CREATE TABLE clientes (
    idcliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(100),
    data_operacao DATE,
    data_ultimo_pedido DATE,
    total_pedidos DECIMAL(10, 2)
);

CREATE TABLE pedidos (
    idpedido INT AUTO_INCREMENT PRIMARY KEY,
    idcliente INT,
    total DECIMAL(10, 2),
    data_pedido DATE,
    FOREIGN KEY (idcliente) REFERENCES clientes(idcliente)
);

-- Inserir alguns clientes
INSERT INTO clientes (nome, email,data_operacao,data_ultimo_pedido,total_pedidos ) VALUES
   -- ('Cliente 1', 'cliente1@email.com','2020-05-05','2020-05-05', 100.00),
   -- ('Cliente 2', 'cliente2@email.com','2020-05-05','2020-05-05', 150.50);
	('Cliente 3', 'cliente2@email.com',null,'2020-05-05', 150.50);

-- Inserir alguns pedidos
INSERT INTO pedidos (idcliente, total, data_pedido) VALUES
    -- (1, 100.00, '2023-10-19'),
    -- (2, 150.50, '2023-10-20');
    (1, 200.00, '2023-12-14');


-- 1 - Trigger para atualizar a data do último pedido do cliente: deve ser acionada sempre que um novo pedido é inserido na tabela "pedidos".
-- Ela atualiza o campo "data_ultimo_pedido" na tabela "clientes" com a data do novo pedido como a data do último pedido do cliente.

DELIMITER // 
CREATE TRIGGER atualiza_data_ultimo_pedido
after insert on pedidos 
for each row
BEGIN 
	UPDATE clientes 
    SET data_ultimo_pedido = NEW.data_pedido
    where idcliente = NEW.idcliente; 
END; 
//
DELIMITER ; 
SHOW TRIGGERS;
select * from pedidos;
select * from clientes;

 
-- 2 - Trigger para registrar a data de operação de um novo cliente: é acionado sempre que um novo cliente é inserido na tabela "clientes".
-- Ela registra a data da operação do cliente no campo "data_operacao" na tabela clientes.
DROP TRIGGER registrar_data_operacao
DELIMITER // 
CREATE TRIGGER registrar_data_operacao
BEFORE insert on clientes 
for each row
BEGIN 
    SET NEW.data_operacao = now();
END; 
//
DELIMITER ; 

Show triggers; 
select * from clientes;
-- 3 - Trigger para impedir exclusão de todos os pedidos cujo valor seja maior do que 3 mil reais. Apresentar mensagem 'Exclusão impossibilitada por alto valor.'
DELIMITER //
CREATE  TRIGGER impedir_exclusao_pedido_valor_alto
BEFORE DELETE ON pedidos
FOR EACH ROW
BEGIN
    DECLARE valor_pedido decimal(10,2);
    SELECT total INTO valor_pedido FROM pedidos WHERE idpedido = OLD.idpedido;
    IF valor_pedido > 3000.00 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
        'Exclusão impossibilitada por alto valor.';
    END IF;
END;
//
DELIMITER ;

INSERT INTO pedidos (idcliente, total, data_pedido)
VALUES (2, 3800.00, '2023-12-14');
select * from pedidos;
delete from pedidos where idpedido = 1;
SHOW TRIGGERS;