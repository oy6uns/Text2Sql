SELECT e.Name AS ManagerName, COUNT(s.ShipmentID) AS NumberOfShipments
FROM Employee e
LEFT JOIN Shipment s ON e.EmployeeID = s.Manager
GROUP BY e.Name
ORDER BY e.Name;
