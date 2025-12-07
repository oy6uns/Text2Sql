SELECT Name
FROM Planet
WHERE PlanetID IN (
    SELECT Planet
    FROM Has_Clearance
    GROUP BY Planet
    HAVING COUNT(DISTINCT Employee) = 1
)
