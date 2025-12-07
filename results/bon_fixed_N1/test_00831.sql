SELECT city1_code AS city_code, SUM(distance) AS total_distance_to_all_other_cities
FROM Direct_distance
GROUP BY city1_code;
