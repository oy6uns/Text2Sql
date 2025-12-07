SELECT 
  SUM(CAST(Points AS FLOAT)) AS total_points, 
  AVG(CAST(Points AS FLOAT)) AS average_points 
FROM driver;
