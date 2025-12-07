SELECT COALESCE(SUM(P.Weight), 0) AS TotalWeight
FROM Package P
JOIN Shipment S ON P.Shipment = S.ShipmentID
JOIN Planet PL ON S.Planet = PL.PlanetID
WHERE PL.Name = 'Mars';
