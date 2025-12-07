SELECT AVG(distance) AS average_distance
FROM Direct_distance dd
JOIN City c1 ON dd.city1_code = c1.city_code
JOIN City c2 ON dd.city2_code = c2.city_code
WHERE (c1.city_name = 'Boston' AND c2.city_name <> 'Boston')
   OR (c2.city_name = 'Boston' AND c1.city_name <> 'Boston');
