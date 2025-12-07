SELECT p.Name AS PlanetName, COUNT(s.ShipmentID) AS TotalShipments
FROM Planet p
LEFT JOIN Shipment s ON p.PlanetID = s.Planet
GROUP BY p.Name
ORDER BY p.Name;
