SELECT c.country
FROM Student s
JOIN City c ON s.city_code = c.city_code
GROUP BY c.country
ORDER BY COUNT(*) ASC
LIMIT 1;
