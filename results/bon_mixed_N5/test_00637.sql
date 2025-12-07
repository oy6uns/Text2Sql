SELECT c.Name, SUM(co.Quantity) AS Total_Quantity
FROM customer c
JOIN customer_order co ON c.Customer_ID = co.Customer_ID
GROUP BY c.Name;
