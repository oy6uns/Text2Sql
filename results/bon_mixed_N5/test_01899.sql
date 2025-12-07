SELECT DISTINCT s.ShipmentID
FROM Shipment s
JOIN Planet p ON s.Planet = p.PlanetID
LEFT JOIN Employee e ON s.Manager = e.EmployeeID
WHERE p.Name = 'Mars' OR e.Name = 'Turanga Leela'
