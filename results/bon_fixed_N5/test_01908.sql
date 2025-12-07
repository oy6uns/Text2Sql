SELECT COALESCE(SUM(P.Weight), 0) AS TotalWeight
FROM Package P
JOIN Shipment S ON P.Shipment = S.ShipmentID
JOIN Planet Pl ON S.Planet = Pl.PlanetID
WHERE Pl.Name = 'Mars';
