SELECT country
FROM City c
JOIN Student s ON c.city_code = s.city_code
GROUP BY country
ORDER BY COUNT(s.StuID) ASC
LIMIT 1;
