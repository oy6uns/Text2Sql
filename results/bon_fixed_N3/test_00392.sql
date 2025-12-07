SELECT Analytical_Layer_Type_Code, COUNT(*) AS Usage_Count
FROM Analytical_Layer
GROUP BY Analytical_Layer_Type_Code;
