SELECT p.Name
FROM Planet p
JOIN Shipment s ON p.PlanetID = s.Planet
GROUP BY p.PlanetID, p.Name
ORDER BY COUNT(s.ShipmentID) DESC
LIMIT 1;
