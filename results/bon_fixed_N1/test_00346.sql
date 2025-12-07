SELECT Completed_Year
FROM building
GROUP BY Completed_Year
ORDER BY COUNT(*) DESC
LIMIT 1;
