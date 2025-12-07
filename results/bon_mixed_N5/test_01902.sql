SELECT Planet.Name AS PlanetName, COUNT(Shipment.ShipmentID) AS ShipmentCount
FROM Planet
LEFT JOIN Shipment ON Planet.PlanetID = Shipment.Planet
GROUP BY Planet.Name
ORDER BY Planet.Name;
