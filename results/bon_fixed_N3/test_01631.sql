SELECT c.Country
FROM country c
JOIN driver d ON c.Country_Id = d.Country
WHERE d.Make IN ('Dodge', 'Chevrolet')
GROUP BY c.Country, c.Country_Id
HAVING COUNT(DISTINCT CASE WHEN d.Make = 'Dodge' THEN d.Driver_ID END) > 0
   AND COUNT(DISTINCT CASE WHEN d.Make = 'Chevrolet' THEN d.Driver_ID END) > 0;
