SELECT COALESCE(SUM(p.Weight), 0) AS TotalWeight
FROM Package p
JOIN Shipment s ON p.Shipment = s.ShipmentID
JOIN Planet pl ON s.Planet = pl.PlanetID
WHERE pl.Name = 'Mars';
