SELECT SUM(P.Weight)
FROM Package P
JOIN Shipment S ON P.Shipment = S.ShipmentID
JOIN Planet PL ON S.Planet = PL.PlanetID
WHERE PL.Name = 'Mars'
