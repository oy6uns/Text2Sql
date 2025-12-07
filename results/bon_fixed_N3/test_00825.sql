SELECT AVG(distance) AS avg_distance
FROM Direct_distance
WHERE (city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') AND city2_code <> (SELECT city_code FROM City WHERE city_name = 'Boston'))
   OR (city2_code = (SELECT city_code FROM City WHERE city_name = 'Boston') AND city1_code <> (SELECT city_code FROM City WHERE city_name = 'Boston'));
