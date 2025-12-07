SELECT DISTINCT c.Country
FROM country c
JOIN driver d ON c.Country_Id = d.Country
WHERE d.Make = 'Dodge'
AND c.Country_Id IN (
    SELECT Country
    FROM driver
    WHERE Make = 'Chevrolet'
)
