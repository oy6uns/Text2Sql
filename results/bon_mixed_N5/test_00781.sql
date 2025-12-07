SELECT state
FROM City
GROUP BY state
HAVING COUNT(DISTINCT city_code) >= 2;
