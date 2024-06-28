DELIMITER //

CREATE PROCEDURE manage_order_data(
    IN action INT,
    IN p_idOrder INT,
    IN p_idOrderClient INT,
    IN p_OrderStatus ENUM('Cancelado', 'Confirmado', 'Em processamento'),
    IN p_OrderDescription VARCHAR(255),
    IN p_sendValue FLOAT,
    IN p_PaymentCash BOOLEAN
)
BEGIN
    CASE action
        WHEN 1 THEN
            -- SELECT statement
            SELECT * FROM orders WHERE idOrder = p_idOrder;
        WHEN 2 THEN
            -- UPDATE statement
            UPDATE orders
            SET idOrderClient = p_idOrderClient,
                OrderStatus = p_OrderStatus,
                OrderDescription = p_OrderDescription,
                sendValue = p_sendValue,
                PaymentCash = p_PaymentCash
            WHERE idOrder = p_idOrder;
        WHEN 3 THEN
            -- DELETE statement
            DELETE FROM orders WHERE idOrder = p_idOrder;
        ELSE
            -- Default case
            SELECT 'Invalid action' AS message;
    END CASE;
END //

DELIMITER ;

# Para selecionar um pedido com idOrder = 1.
CALL manage_order_data(1, 1, NULL, NULL, NULL, NULL, NULL);

# Para atualizar os dados de um pedido com idOrder = 1.
CALL manage_order_data(2, 1, 1, 'Confirmado', 'New Order Description', 20.0, TRUE);

# Para deletar um pedido com idOrder = 1.
CALL manage_order_data(3, 1, NULL, NULL, NULL, NULL, NULL);