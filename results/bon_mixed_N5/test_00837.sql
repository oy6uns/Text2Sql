SELECT s.Fname, s.LName
FROM Student s
JOIN Student l ON l.Fname = 'Linda' AND l.LName = 'Smith'
JOIN City c_s ON s.city_code = c_s.city_code
JOIN City c_l ON l.city_code = c_l.city_code
LEFT JOIN Direct_distance d ON 
  (d.city1_code = l.city_code AND d.city2_code = s.city_code) OR 
  (d.city2_code = l.city_code AND d.city1_code = s.city_code)
WHERE s.StuID <> l.StuID
ORDER BY d.distance DESC NULLS LAST
LIMIT 1
