use ecommercer
# Procedure para Manipular Dados
DELIMITER //
CREATE PROCEDURE manage_client_data(
    IN action INT,
    IN p_idClient INT,
    IN p_Fname VARCHAR(10),
    IN p_Mint CHAR(3),
    IN p_Lname VARCHAR(20),
    IN p_CPF CHAR(11),
    IN p_Phone CHAR(11)
)
BEGIN
    CASE action
        WHEN 1 THEN
            -- SELECT statement
            SELECT * FROM client WHERE idClient = p_idClient;
        WHEN 2 THEN
            -- UPDATE statement
            UPDATE client
            SET Fname = p_Fname,
                Mint = p_Mint,
                Lname = p_Lname,
                CPF = p_CPF,
                Phone = p_Phone
            WHERE idClient = p_idClient;
        WHEN 3 THEN
            -- DELETE statement
            DELETE FROM client WHERE idClient = p_idClient;
        ELSE
            -- Default case
            SELECT 'Invalid action' AS message;
    END CASE;
END //
DELIMITER ;

# SELECT: Para selecionar um cliente com idClient = 1
CALL manage_client_data(1, 1, NULL, NULL, NULL, NULL, NULL);

# UPDATE: Para atualizar os dados de um cliente com idClient = 1
CALL manage_client_data(2, 1, 'John', 'D', 'Doe', '12345678901', '09876543210');

# DELETE: Para deletar um cliente com idClient = 1
CALL manage_client_data(3, 1, NULL, NULL, NULL, NULL, NULL);
