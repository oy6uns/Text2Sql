SELECT c.city_name
FROM City c
JOIN Direct_distance d ON ( (d.city1_code = c.city_code AND d.city2_code = (SELECT city_code FROM City WHERE city_name = 'Boston')) 
                          OR (d.city2_code = c.city_code AND d.city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston')) )
WHERE c.city_code <> (SELECT city_code FROM City WHERE city_name = 'Boston')
ORDER BY d.distance DESC
LIMIT 1;
