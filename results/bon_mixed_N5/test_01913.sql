SELECT p.PackageNumber
FROM Package p
JOIN Shipment s ON p.Shipment = s.ShipmentID
JOIN Planet pl ON s.Planet = pl.PlanetID
JOIN Client c ON p.Sender = c.AccountNumber
WHERE pl.Name = 'Omicron Persei 8'
  AND c.Name = 'Zapp Brannigan'
