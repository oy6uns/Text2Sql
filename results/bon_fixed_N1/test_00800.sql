SELECT country
FROM City
JOIN Student ON City.city_code = Student.city_code
GROUP BY country
ORDER BY COUNT(Student.StuID)
LIMIT 1;
