SELECT c.Name, SUM(co.Quantity) AS Total_Quantity
FROM customer_order co
JOIN customer c ON co.Customer_ID = c.Customer_ID
GROUP BY c.Name;
