SELECT Completed_Year, COUNT(*) AS Number_of_Buildings
FROM building
GROUP BY Completed_Year
ORDER BY Completed_Year;
