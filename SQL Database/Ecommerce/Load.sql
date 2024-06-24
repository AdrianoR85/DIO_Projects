INSERT INTO client (Fname, Mint, Lname, CPF, Phone) VALUES
('Alice', 'A', 'Smith', '12345678901', '5551234567'),
('Bob', 'B', 'Johnson', '23456789012', '5552345678'),
('Carol', 'C', 'Williams', '34567890123', '5553456789'),
('David', 'D', 'Brown', '45678901234', '5554567890'),
('Eve', 'E', 'Jones', '56789012345', '5555678901'),
('Frank', 'F', 'Garcia', '67890123456', '5556789012'),
('Grace', 'G', 'Martinez', '78901234567', '5557890123'),
('Hank', 'H', 'Rodriguez', '89012345678', '5558901234'),
('Ivy', 'I', 'Wilson', '90123456789', '5559012345'),
('Jack', 'J', 'Lopez', '01234567890', '5550123456'),
('Kathy', 'K', 'Gonzalez', '09876543210', '5559876543'),
('Leo', 'L', 'Harris', '10987654321', '5558765432'),
('Mona', 'M', 'Clark', '21098765432', '5557654321'),
('Nina', 'N', 'Lewis', '32109876543', '5556543210'),
('Owen', 'O', 'Lee', '43210987654', '5555432109'),
('Paul', 'P', 'Walker', '54321098765', '5554321098'),
('Quinn', 'Q', 'Hall', '65432109876', '5553210987'),
('Rita', 'R', 'Young', '76543210987', '5552109876'),
('Sam', 'S', 'King', '87654321098', '5551098765'),
('Tina', 'T', 'Scott', '98765432109', '5550987654');


INSERT INTO address (idAddressClient, Street, Anumber, City, State, PostalCode) VALUES
(1, 'Main St', '100', 'Springfield', 'IL', '62701'),
(2, 'Oak St', '200', 'Springfield', 'IL', '62702'),
(3, 'Pine St', '300', 'Springfield', 'IL', '62703'),
(4, 'Maple St', '400', 'Springfield', 'IL', '62704'),
(5, 'Elm St', '500', 'Springfield', 'IL', '62705'),
(6, 'Birch St', '600', 'Springfield', 'IL', '62706'),
(7, 'Cedar St', '700', 'Springfield', 'IL', '62707'),
(8, 'Ash St', '800', 'Springfield', 'IL', '62708'),
(9, 'Cherry St', '900', 'Springfield', 'IL', '62709'),
(10, 'Walnut St', '1000', 'Springfield', 'IL', '62710'),
(11, 'Poplar St', '1100', 'Springfield', 'IL', '62711'),
(12, 'Hickory St', '1200', 'Springfield', 'IL', '62712'),
(13, 'Magnolia St', '1300', 'Springfield', 'IL', '62713'),
(14, 'Dogwood St', '1400', 'Springfield', 'IL', '62714'),
(15, 'Sycamore St', '1500', 'Springfield', 'IL', '62715'),
(16, 'Willow St', '1600', 'Springfield', 'IL', '62716'),
(17, 'Fir St', '1700', 'Springfield', 'IL', '62717'),
(18, 'Redwood St', '1800', 'Springfield', 'IL', '62718'),
(19, 'Cypress St', '1900', 'Springfield', 'IL', '62719'),
(20, 'Juniper St', '2000', 'Springfield', 'IL', '62720');

INSERT INTO product (Pname, Classificationkids, Category, Reviews, size) VALUES
('Toy Car', true, 'Brinquedo', 4.5, 'Small'),
('Laptop', false, 'Eletrônico', 4.7, 'Medium'),
('T-Shirt', false, 'Vestimento', 4.2, 'Large'),
('Chocolate', false, 'Alimentos', 4.8, 'Medium'),
('Doll', true, 'Brinquedo', 4.3, 'Small'),
('Phone', false, 'Eletrônico', 4.6, 'Small'),
('Jacket', false, 'Vestimento', 4.1, 'Large'),
('Chips', false, 'Alimentos', 4.5, 'Medium'),
('Puzzle', true, 'Brinquedo', 4.4, 'Medium'),
('Tablet', false, 'Eletrônico', 4.7, 'Medium'),
('Jeans', false, 'Vestimento', 4.3, 'Large'),
('Candy', false, 'Alimentos', 4.9, 'Small'),
('Robot', true, 'Brinquedo', 4.5, 'Medium'),
('Camera', false, 'Eletrônico', 4.6, 'Small'),
('Sweater', false, 'Vestimento', 4.4, 'Large'),
('Cookies', false, 'Alimentos', 4.8, 'Medium'),
('Building Blocks', true, 'Brinquedo', 4.5, 'Medium'),
('Monitor', false, 'Eletrônico', 4.7, 'Large'),
('Hat', false, 'Vestimento', 4.2, 'Small'),
('Juice', false, 'Alimentos', 4.7, 'Large');


INSERT INTO payment (idPaymentClient, TypePayment, limitAvaible) VALUES
(1, 'Cartão', 500.00),
(2, 'Boleto', 300.00),
(3, 'Dois cartões', 700.00),
(4, 'Cartão', 600.00),
(5, 'Boleto', 200.00),
(6, 'Dois cartões', 800.00),
(7, 'Cartão', 500.00),
(8, 'Boleto', 400.00),
(9, 'Dois cartões', 900.00),
(10, 'Cartão', 1000.00),
(11, 'Boleto', 300.00),
(12, 'Dois cartões', 700.00),
(13, 'Cartão', 600.00),
(14, 'Boleto', 200.00),
(15, 'Dois cartões', 800.00),
(16, 'Cartão', 500.00),
(17, 'Boleto', 400.00),
(18, 'Dois cartões', 900.00),
(19, 'Cartão', 1000.00),
(20, 'Boleto', 300.00);

INSERT INTO orders (idOrderClient, OrderStatus, OrderDescription, sendValue, PaymentCash) VALUES
(1, 'Confirmado', 'Order for electronics', 15.00, false),
(2, 'Em processamento', 'Order for clothing', 10.00, true),
(3, 'Cancelado', 'Order for toys', 20.00, false),
(4, 'Confirmado', 'Order for food', 5.00, true),
(5, 'Em processamento', 'Order for electronics', 15.00, false),
(6, 'Cancelado', 'Order for clothing', 10.00, true),
(7, 'Confirmado', 'Order for toys', 20.00, false),
(8, 'Em processamento', 'Order for food', 5.00, true),
(9, 'Cancelado', 'Order for electronics', 15.00, false),
(10, 'Confirmado', 'Order for clothing', 10.00, true),
(11, 'Em processamento', 'Order for toys', 20.00, false),
(12, 'Cancelado', 'Order for food', 5.00, true),
(13, 'Confirmado', 'Order for electronics', 15.00, false),
(14, 'Em processamento', 'Order for clothing', 10.00, true),
(15, 'Cancelado', 'Order for toys', 20.00, false),
(16, 'Confirmado', 'Order for food', 5.00, true),
(17, 'Em processamento', 'Order for electronics', 15.00, false),
(18, 'Cancelado', 'Order for clothing', 10.00, true),
(19, 'Confirmado', 'Order for toys', 20.00, false),
(20, 'Em processamento', 'Order for food', 5.00, true);

INSERT INTO productStorage (idProductSupplier, StorageLocation, quantity) VALUES
(1, 'Warehouse A', 100),
(2, 'Warehouse B', 200),
(3, 'Warehouse C', 300),
(4, 'Warehouse D', 150),
(5, 'Warehouse E', 250),
(6, 'Warehouse F', 350),
(7, 'Warehouse G', 400),
(8, 'Warehouse H', 450),
(9, 'Warehouse I', 500),
(10, 'Warehouse J', 550),
(11, 'Warehouse K', 600),
(12, 'Warehouse L', 650),
(13, 'Warehouse M', 700),
(14, 'Warehouse N', 750),
(15, 'Warehouse O', 800),
(16, 'Warehouse P', 850),
(17, 'Warehouse Q', 900),
(18, 'Warehouse R', 950),
(19, 'Warehouse S', 1000),
(20, 'Warehouse T', 1050);


INSERT INTO supplier (SocialName, CNPJ, Contact) VALUES
('Supplier A', '12345678901', '5551234567'),
('Supplier B', '23456789012', '5552345678'),
('Supplier C', '34567890123', '5553456789'),
('Supplier D', '45678901234', '5554567890'),
('Supplier E', '56789012345', '5555678901'),
('Supplier F', '67890123456', '5556789012'),
('Supplier G', '78901234567', '5557890123'),
('Supplier H', '89012345678', '5558901234'),
('Supplier I', '90123456789', '5559012345'),
('Supplier J', '01234567890', '5550123456'),
('Supplier K', '09876543210', '5559876543'),
('Supplier L', '10987654321', '5558765432'),
('Supplier M', '21098765432', '5557654321'),
('Supplier N', '32109876543', '5556543210'),
('Supplier O', '43210987654', '5555432109'),
('Supplier P', '54321098765', '5554321098'),
('Supplier Q', '65432109876', '5553210987'),
('Supplier R', '76543210987', '5552109876'),
('Supplier S', '87654321098', '5551098765'),
('Supplier T', '98765432109', '5550987654');


INSERT INTO seller (SocialName, AbstName, CNPJ, CPF, Location, Contact) VALUES
('Seller A', 'Seller A LLC', '12345678901', '123456789', '123 Main St', '5551234567'),
('Seller B', 'Seller B LLC', '23456789012', '234567890', '234 Oak St', '5552345678'),
('Seller C', 'Seller C LLC', '34567890123', '345678901', '345 Pine St', '5553456789'),
('Seller D', 'Seller D LLC', '45678901234', '456789012', '456 Maple St', '5554567890'),
('Seller E', 'Seller E LLC', '56789012345', '567890123', '567 Elm St', '5555678901'),
('Seller F', 'Seller F LLC', '67890123456', '678901234', '678 Birch St', '5556789012'),
('Seller G', 'Seller G LLC', '78901234567', '789012345', '789 Cedar St', '5557890123'),
('Seller H', 'Seller H LLC', '89012345678', '890123456', '890 Ash St', '5558901234'),
('Seller I', 'Seller I LLC', '90123456789', '901234567', '901 Cherry St', '5559012345'),
('Seller J', 'Seller J LLC', '01234567890', '012345678', '012 Walnut St', '5550123456'),
('Seller K', 'Seller K LLC', '09876543210', '098765432', '098 Poplar St', '5559876543'),
('Seller L', 'Seller L LLC', '10987654321', '109876543', '109 Hickory St', '5558765432'),
('Seller M', 'Seller M LLC', '21098765432', '210987654', '210 Magnolia St', '5557654321'),
('Seller N', 'Seller N LLC', '32109876543', '321098765', '321 Dogwood St', '5556543210'),
('Seller O', 'Seller O LLC', '43210987654', '432109876', '432 Sycamore St', '5555432109'),
('Seller P', 'Seller P LLC', '54321098765', '543210987', '543 Willow St', '5554321098'),
('Seller Q', 'Seller Q LLC', '65432109876', '654321098', '654 Fir St', '5553210987'),
('Seller R', 'Seller R LLC', '76543210987', '765432109', '765 Redwood St', '5552109876'),
('Seller S', 'Seller S LLC', '87654321098', '876543210', '876 Cypress St', '5551098765'),
('Seller T', 'Seller T LLC', '98765432109', '987654321', '987 Juniper St', '5550987654');

INSERT INTO productSeller (idProdSeller, idProdProduct, ProdQuantity) VALUES
(1, 1, 10),
(2, 2, 20),
(3, 3, 30),
(4, 4, 15),
(5, 5, 25),
(6, 6, 35),
(7, 7, 40),
(8, 8, 45),
(9, 9, 50),
(10, 10, 55),
(11, 11, 60),
(12, 12, 65),
(13, 13, 70),
(14, 14, 75),
(15, 15, 80),
(16, 16, 85),
(17, 17, 90),
(18, 18, 95),
(19, 19, 100),
(20, 20, 105);

select * from productstorage p;

INSERT INTO productOrder (idProdOrder, idOrderProduct, PoQuantity, PoStatus) VALUES
(21, 1, 5, 'Disponível'),
(22, 2, 10, 'Sem Estoque'),
(23, 3, 15, 'Disponível'),
(24, 4, 20, 'Sem Estoque'),
(25, 5, 25, 'Disponível'),
(26, 6, 30, 'Sem Estoque'),
(27, 7, 35, 'Disponível'),
(28, 8, 40, 'Sem Estoque'),
(29, 9, 45, 'Disponível'),
(30, 10, 50, 'Sem Estoque'),
(31, 11, 55, 'Disponível'),
(32, 12, 60, 'Sem Estoque'),
(33, 13, 65, 'Disponível'),
(34, 14, 70, 'Sem Estoque'),
(35, 15, 75, 'Disponível'),
(36, 16, 80, 'Sem Estoque'),
(37, 17, 85, 'Disponível'),
(38, 18, 90, 'Sem Estoque'),
(39, 19, 95, 'Disponível'),
(40, 20, 100, 'Sem Estoque');

INSERT INTO storageLocation (idLocProduct, idLocStorage, Location) VALUES
(21,21, 'Section A'),
(22,22, 'Section B'),
(23, 23, 'Section C'),
(24, 24, 'Section D'),
(25, 25, 'Section E'),
(26, 26, 'Section F'),
(27, 27, 'Section G'),
(28, 28, 'Section H'),
(29, 29, 'Section I'),
(30, 30, 'Section J'),
(31, 31, 'Section K'),
(32, 32, 'Section L'),
(33, 33, 'Section M'),
(34, 34, 'Section N'),
(35, 35, 'Section O'),
(36, 36, 'Section P'),
(37, 37, 'Section Q'),
(38, 38, 'Section R'),
(39, 39, 'Section S'),
(40, 40, 'Section T');

UPDATE productStorage SET price = 19.99 WHERE idProdStorage = 21;
UPDATE productStorage SET price = 29.99 WHERE idProdStorage = 22;
UPDATE productStorage SET price = 39.99 WHERE idProdStorage = 23;
UPDATE productStorage SET price = 24.99 WHERE idProdStorage = 24;
UPDATE productStorage SET price = 34.99 WHERE idProdStorage = 25;
UPDATE productStorage SET price = 44.99 WHERE idProdStorage = 26;
UPDATE productStorage SET price = 49.99 WHERE idProdStorage = 27;
UPDATE productStorage SET price = 54.99 WHERE idProdStorage = 28;
UPDATE productStorage SET price = 59.99 WHERE idProdStorage = 29;
UPDATE productStorage SET price = 64.99 WHERE idProdStorage = 30;
UPDATE productStorage SET price = 69.99 WHERE idProdStorage = 31;
UPDATE productStorage SET price = 74.99 WHERE idProdStorage = 32;
UPDATE productStorage SET price = 79.99 WHERE idProdStorage = 33;
UPDATE productStorage SET price = 84.99 WHERE idProdStorage = 34;
UPDATE productStorage SET price = 89.99 WHERE idProdStorage = 35;
UPDATE productStorage SET price = 94.99 WHERE idProdStorage = 36;
UPDATE productStorage SET price = 99.99 WHERE idProdStorage = 37;
UPDATE productStorage SET price = 104.99 WHERE idProdStorage = 38;
UPDATE productStorage SET price = 109.99 WHERE idProdStorage = 39;
UPDATE productStorage SET price = 114.99 WHERE idProdStorage = 40;
