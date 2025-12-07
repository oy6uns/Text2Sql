SELECT c.Capital
FROM driver d
JOIN country c ON d.Country = c.Country_Id
ORDER BY CAST(d.Points AS FLOAT) DESC
LIMIT 1;
