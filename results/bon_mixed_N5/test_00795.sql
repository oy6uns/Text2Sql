SELECT c.city_name, COUNT(s.StuID) AS number_of_students
FROM City c
LEFT JOIN Student s ON c.city_code = s.city_code
GROUP BY c.city_name
ORDER BY c.city_name;
