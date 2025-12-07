SELECT e.Name AS ManagerName, COUNT(s.ShipmentID) AS NumberOfShipments
FROM Shipment s
JOIN Employee e ON s.Manager = e.EmployeeID
GROUP BY e.Name, e.EmployeeID
ORDER BY NumberOfShipments DESC;
