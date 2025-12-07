SELECT c2.city_name
FROM City c1
JOIN Direct_distance d ON c1.city_code = d.city1_code
JOIN City c2 ON d.city2_code = c2.city_code
WHERE c1.city_name = 'Boston'
ORDER BY d.distance DESC
LIMIT 1;
