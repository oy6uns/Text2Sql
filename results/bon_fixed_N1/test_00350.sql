SELECT Completed_Year
FROM building
GROUP BY Completed_Year
HAVING 
    SUM(CASE WHEN Number_of_Stories > 20 THEN 1 ELSE 0 END) > 0
    AND
    SUM(CASE WHEN Number_of_Stories < 15 THEN 1 ELSE 0 END) > 0;
