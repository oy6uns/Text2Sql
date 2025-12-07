SELECT state
FROM City
GROUP BY state
HAVING COUNT(city_code) >= 2;
