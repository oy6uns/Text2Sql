SELECT c1.city_name AS Linda_City, c2.city_name AS Tracy_City, dd.distance
FROM Student s1
JOIN City c1 ON s1.city_code = c1.city_code
JOIN Student s2 ON s2.city_code = c2.city_code
JOIN City c2 ON s2.city_code = c2.city_code
JOIN Direct_distance dd ON 
  (dd.city1_code = c1.city_code AND dd.city2_code = c2.city_code)
  OR
  (dd.city1_code = c2.city_code AND dd.city2_code = c1.city_code)
WHERE s1.Fname = 'Linda' AND s1.LName = 'Smith'
  AND s2.Fname = 'Tracy' AND s2.LName = 'Kim';
