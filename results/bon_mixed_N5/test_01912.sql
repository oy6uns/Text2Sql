SELECT p.Name
FROM Planet p
JOIN Shipment s ON p.PlanetID = s.Planet
JOIN Package pkg ON s.ShipmentID = pkg.Shipment
GROUP BY p.PlanetID, p.Name
HAVING SUM(pkg.Weight) > 30;
