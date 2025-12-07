SELECT Completed_Year, COUNT(*) AS Number_of_Buildings_Completed
FROM building
GROUP BY Completed_Year
ORDER BY Completed_Year;
