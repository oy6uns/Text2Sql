SELECT city1_code AS city_code, SUM(distance) AS total_distance
FROM Direct_distance
GROUP BY city1_code;
