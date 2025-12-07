SELECT c.customer_name, c.customer_id, COUNT(o.order_id) AS number_of_orders
FROM Customers c
LEFT JOIN Customer_Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name, c.customer_id;
