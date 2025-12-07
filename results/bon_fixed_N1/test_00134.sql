SELECT DISTINCT c.Name
FROM channel c
JOIN director_admin da ON c.Channel_ID = da.Channel_ID
JOIN director d ON da.Director_ID = d.Director_ID
GROUP BY c.Channel_ID, c.Name
HAVING 
  SUM(CASE WHEN d.Age < 40 THEN 1 ELSE 0 END) > 0
  AND
  SUM(CASE WHEN d.Age > 60 THEN 1 ELSE 0 END) > 0;
