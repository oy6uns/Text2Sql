SELECT city1_code AS city_code FROM Direct_distance WHERE distance > (SELECT AVG(distance) FROM Direct_distance)
UNION
SELECT city2_code AS city_code FROM Direct_distance WHERE distance > (SELECT AVG(distance) FROM Direct_distance);
