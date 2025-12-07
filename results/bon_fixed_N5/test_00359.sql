SELECT Analytical_Layer_Type_Code
FROM Analytical_Layer
GROUP BY Analytical_Layer_Type_Code
ORDER BY COUNT(*) DESC
LIMIT 1;
