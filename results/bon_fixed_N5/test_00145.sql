SELECT Affiliation
FROM city_channel
GROUP BY Affiliation
HAVING COUNT(ID) > 3;
