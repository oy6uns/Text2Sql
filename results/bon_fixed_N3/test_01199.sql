SELECT 
    SUM(d.Population) AS total_population,
    AVG(d.Population) AS average_population
FROM 
    district d
JOIN 
    spokesman_district sd ON d.District_ID = sd.District_ID
GROUP BY 
    d.District_ID;
