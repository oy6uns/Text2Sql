SELECT 
  MAX(CAST(Points AS FLOAT)) AS Highest_Points, 
  MIN(CAST(Points AS FLOAT)) AS Lowest_Points 
FROM driver;
