SELECT country
FROM City
GROUP BY country
ORDER BY COUNT(city_code) ASC
LIMIT 1;
