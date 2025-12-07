SELECT Employee.Name, COUNT(Shipment.ShipmentID) AS NumberOfShipmentsManaged
FROM Employee
LEFT JOIN Shipment ON Employee.EmployeeID = Shipment.Manager
GROUP BY Employee.Name
ORDER BY Employee.Name;
