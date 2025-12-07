SELECT s.ShipmentID
FROM Shipment s
JOIN Planet p ON s.Planet = p.PlanetID
JOIN Employee e ON s.Manager = e.EmployeeID
WHERE p.Name = 'Mars' AND e.Name = 'Turanga Leela'
