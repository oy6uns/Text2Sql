SELECT dd.distance
FROM Student s1
JOIN Student s2 ON 1=1
JOIN Direct_distance dd ON ( (dd.city1_code = s1.city_code AND dd.city2_code = s2.city_code) OR (dd.city1_code = s2.city_code AND dd.city2_code = s1.city_code) )
WHERE s1.Fname = 'Linda' AND s1.LName = 'Smith'
  AND s2.Fname = 'Tracy' AND s2.LName = 'Kim';
