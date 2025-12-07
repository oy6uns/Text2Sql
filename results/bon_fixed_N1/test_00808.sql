SELECT StuID 
FROM Student 
JOIN City ON Student.city_code = City.city_code 
WHERE Sex = 'F' AND state = 'PA';
