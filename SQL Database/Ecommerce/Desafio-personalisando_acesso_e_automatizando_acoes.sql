-- Trigger para logging antes de deletar um cliente:
CREATE TRIGGER before_delete_cliente
BEFORE DELETE ON client
FOR EACH ROW
BEGIN
    INSERT INTO cliente_auditoria (idClient, Fname, Lname, Ação, Data) 
    VALUES (OLD.idClient, OLD.Fname, OLD.Lname, 'DELETE', NOW());
END;

-- Triggers de Atualização: Before Update
-- Trigger para logging antes de atualizar o pagamento:
CREATE TRIGGER before_update_pagamento
BEFORE UPDATE ON payment
FOR EACH ROW
BEGIN
    INSERT INTO pagamento_auditoria (idPayment, OldTypePayment, NewTypePayment, Data) 
    VALUES (OLD.idPayment, OLD.TypePayment, NEW.TypePayment, NOW());
END;