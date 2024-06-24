--  List all customers and their vehicles:
SELECT c.Name AS CustomerName, v.LicensePlate, v.Model, v.Year
FROM Customer c
LEFT JOIN Vehicle v ON c.idCustomer = v.Customer_idCustomer;

-- Show all service orders with details (customer, team, and services):
SELECT so.idServiceOrder, so.IssueDate, so.TotalValue, so.Status, so.CompletionDate,
       c.Name AS CustomerName, t.TeamName,
       GROUP_CONCAT(s.Description SEPARATOR ', ') AS ServicesProvided
FROM ServiceOrder so
INNER JOIN Team t ON so.Team_idTeam = t.idTeam
LEFT JOIN Vehicle v ON so.idServiceOrder = v.Customer_idCustomer
LEFT JOIN Customer c ON v.Customer_idCustomer = c.idCustomer
LEFT JOIN ServiceOrderService ss ON so.idServiceOrder = ss.ServiceOrder_idServiceOrder
LEFT JOIN Service s ON ss.Service_idService = s.idService
GROUP BY so.idServiceOrder;

-- Find parts used in each service order along with quantities:
SELECT so.idServiceOrder, p.Description AS PartDescription, sop.Quantity
FROM ServiceOrderPart sop
INNER JOIN Part p ON sop.Part_idPart = p.idPart
INNER JOIN ServiceOrder so ON sop.ServiceOrder_idServiceOrder = so.idServiceOrder;

--  List all service orders with their associated parts and labor costs:
SELECT so.idServiceOrder, so.IssueDate, so.TotalValue, so.Status, so.CompletionDate,
       GROUP_CONCAT(CONCAT(p.Description, ' (Quantity: ', sop.Quantity, ')') SEPARATOR ', ') AS PartsUsed,
       SUM(sr.LaborCost) AS TotalLaborCost
FROM ServiceOrder so
LEFT JOIN ServiceOrderPart sop ON so.idServiceOrder = sop.ServiceOrder_idServiceOrder
LEFT JOIN Part p ON sop.Part_idPart = p.idPart
LEFT JOIN ServiceOrderService ss ON so.idServiceOrder = ss.ServiceOrder_idServiceOrder
LEFT JOIN Service s ON ss.Service_idService = s.idService
LEFT JOIN LaborReference sr ON s.LaborReference_idLaborReference = sr.idLaborReference
GROUP BY so.idServiceOrder;


