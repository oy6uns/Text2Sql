SELECT c.country, COUNT(s.StuID) AS number_of_students
FROM Student s
JOIN City c ON s.city_code = c.city_code
GROUP BY c.country;
