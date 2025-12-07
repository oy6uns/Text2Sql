SELECT c.Name
FROM customer c
JOIN customer_order co ON c.Customer_ID = co.Customer_ID
GROUP BY c.Customer_ID, c.Name
HAVING SUM(co.Quantity) > 1;
