SELECT City.city_name, COUNT(Student.StuID) AS student_count
FROM City
LEFT JOIN Student ON City.city_code = Student.city_code
GROUP BY City.city_name
ORDER BY City.city_name;
