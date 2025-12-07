SELECT Name
FROM Planet
WHERE PlanetID = (
    SELECT Planet
    FROM Shipment
    GROUP BY Planet
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
