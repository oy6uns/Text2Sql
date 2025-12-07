SELECT p.Name, SUM(pkg.Weight) AS TotalWeight
FROM Planet p
JOIN Shipment s ON p.PlanetID = s.Planet
JOIN Package pkg ON s.ShipmentID = pkg.Shipment
GROUP BY p.Name;
