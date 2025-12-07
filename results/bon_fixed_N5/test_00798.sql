SELECT state
FROM City
JOIN Student ON City.city_code = Student.city_code
GROUP BY state
ORDER BY COUNT(*) DESC
LIMIT 1;
