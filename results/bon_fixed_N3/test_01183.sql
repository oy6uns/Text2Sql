SELECT SUM(Population) 
FROM district 
WHERE Area_km IN (
    SELECT Area_km 
    FROM district 
    ORDER BY Area_km DESC 
    LIMIT 3
)
