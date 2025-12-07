SELECT City.city_code, COALESCE(SUM(Direct_distance.distance), 0) AS total_distance
FROM City
LEFT JOIN Direct_distance ON City.city_code = Direct_distance.city1_code
GROUP BY City.city_code
ORDER BY City.city_code;
