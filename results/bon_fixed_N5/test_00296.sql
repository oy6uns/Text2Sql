SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email
FROM Customers c
JOIN Customer_Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.customer_phone, c.customer_email
ORDER BY COUNT(o.order_id) DESC
LIMIT 1;
