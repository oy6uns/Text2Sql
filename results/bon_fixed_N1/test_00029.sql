SELECT Manufacturer
FROM club
GROUP BY Manufacturer
HAVING COUNT(DISTINCT Club_ID) > 1;
