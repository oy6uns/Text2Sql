SELECT city1_code 
FROM Direct_distance 
WHERE distance > (SELECT AVG(distance) FROM Direct_distance)
UNION
SELECT city2_code 
FROM Direct_distance 
WHERE distance > (SELECT AVG(distance) FROM Direct_distance);
