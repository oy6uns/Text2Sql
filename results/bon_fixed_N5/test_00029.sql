SELECT Manufacturer
FROM club
WHERE Manufacturer IS NOT NULL
GROUP BY Manufacturer
HAVING COUNT(DISTINCT Club_ID) > 1;
