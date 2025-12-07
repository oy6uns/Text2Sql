SELECT c.state
FROM Student s
JOIN City c ON s.city_code = c.city_code
GROUP BY c.state
HAVING COUNT(*) > 5;
