SELECT D.distance
FROM Student S1
JOIN Student S2 ON 1=1
JOIN Direct_distance D ON ( (D.city1_code = S1.city_code AND D.city2_code = S2.city_code) OR (D.city1_code = S2.city_code AND D.city2_code = S1.city_code) )
WHERE S1.Fname = 'Linda' AND S1.LName = 'Smith'
  AND S2.Fname = 'Tracy' AND S2.LName = 'Kim';
