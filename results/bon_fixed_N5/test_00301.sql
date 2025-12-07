SELECT COUNT(*) 
FROM Customers c
LEFT JOIN Customer_Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
