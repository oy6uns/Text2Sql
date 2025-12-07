SELECT c.Country
FROM country c
LEFT JOIN driver d ON c.Country_Id = d.Country
WHERE d.Driver_ID IS NULL;
