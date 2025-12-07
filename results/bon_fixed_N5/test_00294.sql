SELECT c.customer_id, c.customer_name, COUNT(o.order_id) AS number_of_orders
FROM Customers c
LEFT JOIN Customer_Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;
