SELECT c.state
FROM Student s
JOIN City c ON s.city_code = c.city_code
WHERE s.Fname = 'Linda';
