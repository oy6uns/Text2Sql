SELECT c.Country
FROM country c
JOIN driver d ON c.Country_Id = d.Country
WHERE d.Make IN ('Dodge', 'Chevrolet')
GROUP BY c.Country
HAVING COUNT(DISTINCT d.Make) = 2;
