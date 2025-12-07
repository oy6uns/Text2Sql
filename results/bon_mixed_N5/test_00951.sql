SELECT s.Name, SUM(st.Quantity) AS Total_Headphones
FROM store s
JOIN stock st ON s.Store_ID = st.Store_ID
GROUP BY s.Name
ORDER BY Total_Headphones DESC
LIMIT 1;
