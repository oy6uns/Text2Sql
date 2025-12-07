SELECT c1.city_name, AVG(dd.distance) AS avg_distance_to_other_cities
FROM City c1
JOIN Direct_distance dd ON c1.city_code = dd.city1_code
GROUP BY c1.city_name
ORDER BY c1.city_name;
