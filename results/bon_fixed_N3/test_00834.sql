SELECT 
  c.city_name,
  AVG(d.distance) AS average_distance
FROM 
  City c
LEFT JOIN 
  Direct_distance d ON c.city_code = d.city1_code
GROUP BY 
  c.city_name
ORDER BY 
  c.city_name;
