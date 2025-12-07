SELECT s.Fname || ' ' || s.LName AS full_name
FROM Student s
JOIN City c ON s.city_code = c.city_code
JOIN Student ls ON ls.Fname = 'Linda' AND ls.LName = 'Smith'
JOIN City lc ON ls.city_code = lc.city_code
LEFT JOIN Direct_distance dd ON 
    (dd.city1_code = c.city_code AND dd.city2_code = lc.city_code) OR 
    (dd.city2_code = c.city_code AND dd.city1_code = lc.city_code)
ORDER BY dd.distance DESC NULLS LAST
LIMIT 1;
