SELECT Name, Population
FROM district
WHERE Area_km > (SELECT AVG(Area_km) FROM district);
