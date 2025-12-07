SELECT c.city_name
FROM City c
JOIN Student s ON c.city_code = s.city_code
GROUP BY c.city_name
HAVING COUNT(s.StuID) >= 3;
