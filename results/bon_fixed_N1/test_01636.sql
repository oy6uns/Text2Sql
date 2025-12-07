SELECT Country 
FROM country 
WHERE Country_Id NOT IN (SELECT DISTINCT Country FROM driver WHERE Country IS NOT NULL)
