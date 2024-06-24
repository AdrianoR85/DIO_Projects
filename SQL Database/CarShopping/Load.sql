INSERT INTO Customer (Name, Address, Phone)
VALUES
    ('John Doe', '123 Main St', '555-1234'),
    ('Jane Smith', '456 Elm St', '555-5678'),
    ('Michael Johnson', '789 Oak St', '555-9876');

INSERT INTO Team (idTeam, TeamName)
VALUES
    (1, 'Mechanics Team'),
    (2, 'Service Team');


INSERT INTO Vehicle (LicensePlate, Model, Year, Customer_idCustomer, Team_idTeam)
VALUES
    ('ABC123', 'Toyota Camry', '2020', 1, 1),
    ('XYZ789', 'Honda Civic', '2018', 2, 1),
    ('DEF456', 'Ford F-150', '2019', 3, 2);

INSERT INTO ServiceOrder (IssueDate, TotalValue, Status, CompletionDate, Team_idTeam)
VALUES
    ('2023-01-15', 250.00, 'Pending', NULL, 1),
    ('2023-02-20', 150.00, 'Completed', '2023-02-25', 2),
    ('2023-03-10', 180.00, 'Pending', NULL, 1);

INSERT INTO Mechanic (Name, Address, Specialty, Team_idTeam)
VALUES
    ('David Brown', '321 Maple Ave', 'Engine Specialist', 1),
    ('Sarah White', '654 Pine St', 'Electrical Specialist', 2),
    ('Robert Green', '987 Cedar Rd', 'Transmission Specialist', 1);

INSERT INTO LaborReference (ServiceDescription, LaborCost)
VALUES
    ('Oil Change', 50.00),
    ('Brake Inspection', 80.00),
    ('Engine Tune-Up', 120.00);

INSERT INTO Service (Description, LaborCost, LaborReference_idLaborReference)
VALUES
    ('Oil Change', '50.00', 1),
    ('Brake Inspection', '80.00', 2),
    ('Engine Tune-Up', '120.00', 3);
    
INSERT INTO Part (Description, Price, Brand)
VALUES
    ('Oil Filter', '10.00', 'AC Delco'),
    ('Brake Pads', '50.00', 'Brembo'),
    ('Spark Plugs', '15.00', 'NGK');
    
INSERT INTO ServiceOrderPart (ServiceOrder_idServiceOrder, Part_idPart, Quantity)
VALUES
    (1, 1, 2),
    (1, 2, 1),
    (2, 2, 2),
    (3, 3, 4);

INSERT INTO ServiceOrderService (ServiceOrder_idServiceOrder, Service_idService)
VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (3, 3);


