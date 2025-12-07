SELECT COUNT(*) AS NumberOfPackages
FROM Package p
JOIN Shipment s ON p.Shipment = s.ShipmentID
JOIN Employee e ON s.Manager = e.EmployeeID
JOIN Planet pl ON s.Planet = pl.PlanetID
WHERE e.Name = 'Zapp Brannigan' AND pl.Name = 'Omicron Persei 8';
