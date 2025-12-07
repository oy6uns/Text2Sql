SELECT Analytical_Layer_Type_Code, COUNT(*) AS usage_count
FROM Analytical_Layer
GROUP BY Analytical_Layer_Type_Code;
