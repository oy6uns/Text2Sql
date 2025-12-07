SELECT city1_code, city2_code
FROM Direct_distance
WHERE distance = (SELECT MAX(distance) FROM Direct_distance);
