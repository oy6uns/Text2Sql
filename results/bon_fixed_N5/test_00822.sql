SELECT DISTINCT city1_code AS city_code FROM Direct_distance WHERE distance < 1000
UNION
SELECT DISTINCT city2_code AS city_code FROM Direct_distance WHERE distance < 1000;
