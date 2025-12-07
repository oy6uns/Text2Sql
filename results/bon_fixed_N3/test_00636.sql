SELECT c.Name, COALESCE(SUM(co.Quantity), 0) AS Total_Quantity
FROM customer c
LEFT JOIN customer_order co ON c.Customer_ID = co.Customer_ID
GROUP BY c.Name;
