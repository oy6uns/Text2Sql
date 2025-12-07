SELECT city_code, SUM(distance) AS total_distance
FROM (
  SELECT city1_code AS city_code, distance FROM Direct_distance
  UNION ALL
  SELECT city2_code AS city_code, distance FROM Direct_distance
) AS distances
GROUP BY city_code
ORDER BY city_code;
