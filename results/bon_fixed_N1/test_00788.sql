SELECT Fname || ' ' || LName AS full_name
FROM Student
JOIN City ON Student.city_code = City.city_code
WHERE City.state = 'MD';
