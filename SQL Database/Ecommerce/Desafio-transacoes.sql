SET autocommit = 0;

START TRANSACTION;

-- Inserindo um novo cliente
INSERT INTO client (Fname, Mint, Lname, CPF, Phone) 
VALUES ('John', 'D', 'Doe', '12345678901', '98765432100');

-- Atualizando o limite de pagamento do cliente recém-adicionado
UPDATE payment 
SET limitAvaible = 1000.00 
WHERE idPaymentClient = (SELECT idClient FROM client WHERE CPF = '12345678901');

-- Inserindo um novo endereço para o cliente
INSERT INTO address (idAddressClient, Street, Anumber, City, State, PostalCode)
VALUES ((SELECT idClient FROM client WHERE CPF = '12345678901'), '123 Main St', '10A', 'CityName', 'ST', '12345-678');

-- Comitando a transação
COMMIT;

ROLLBACK;

DELIMITER //

CREATE PROCEDURE AtualizarClienteEPagamento(
    IN p_idClient INT,
    IN p_newFname VARCHAR(10),
    IN p_newLname VARCHAR(20),
    IN p_newLimit FLOAT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Em caso de erro, faz rollback
        ROLLBACK;
    END;
    
    -- Inicia a transação
    START TRANSACTION;
    
    -- Atualiza o nome do cliente
    UPDATE client 
    SET Fname = p_newFname, Lname = p_newLname 
    WHERE idClient = p_idClient;
    
    -- Atualiza o limite de pagamento do cliente
    UPDATE payment 
    SET limitAvaible = p_newLimit 
    WHERE idPaymentClient = p_idClient;
    
    -- Commit da transação
    COMMIT;
END //

DELIMITER ;

CALL AtualizarClienteEPagamento(1, 'Jane', 'Smith', 2000.00);

-- Realizando o Backup com mysqldump
mysqldump -u root -p ecommerce > ecommerce_backup.sql

-- Recuperando o Banco de Dados a partir do Backup
mysql -u root -p ecommerce < ecommerce_backup.sql

-- Backup com Recursos Adicionais
mysqldump -u root -p --routines --events ecommerce > ecommerce_full_backup.sql

-- Exemplo de Script de Backup e Recovery
# Script de Backup
mysqldump -u root -p --routines --events ecommerce > ecommerce_full_backup.sql

# Script de Recovery
mysql -u root -p ecommerce < ecommerce_full_backup.sql
