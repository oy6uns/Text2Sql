SELECT S.Fname, S.LName
FROM Student S
JOIN (
    SELECT 
        CASE 
            WHEN city1_code = L.city_code THEN city2_code 
            ELSE city1_code 
        END AS other_city_code,
        distance
    FROM Direct_distance
    CROSS JOIN (SELECT city_code FROM Student WHERE Fname = 'Linda' AND LName = 'Smith') L
    WHERE city1_code = L.city_code OR city2_code = L.city_code
) D ON S.city_code = D.other_city_code
ORDER BY D.distance DESC
LIMIT 1;
