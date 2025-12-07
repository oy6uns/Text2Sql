SELECT 
    SUM(d.Population) AS total_population,
    AVG(d.Population) AS average_population
FROM district d
WHERE EXISTS (
    SELECT 1 
    FROM spokesman_district sd 
    WHERE sd.District_ID = d.District_ID
);
