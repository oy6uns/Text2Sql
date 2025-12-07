SELECT 
    SUM(d.Population) AS total_population,
    AVG(d.Population) AS average_population
FROM district d
WHERE d.District_ID IN (
    SELECT DISTINCT District_ID
    FROM spokesman_district
);
