SELECT s.Name, SUM(st.Quantity) AS Total_Quantity
FROM store s
JOIN stock st ON s.Store_ID = st.Store_ID
GROUP BY s.Name
HAVING SUM(st.Quantity) > 0;
