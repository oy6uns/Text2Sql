SELECT Manufacturer
FROM club
GROUP BY Manufacturer
ORDER BY COUNT(*) DESC
LIMIT 1;
