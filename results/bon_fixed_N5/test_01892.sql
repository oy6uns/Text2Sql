SELECT Shipment.ShipmentID
FROM Shipment
JOIN Employee ON Shipment.Manager = Employee.EmployeeID
WHERE Employee.Name = 'Phillip J Fry';
