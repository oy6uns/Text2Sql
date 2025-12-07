SELECT c.gender_code, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.gender_code
ORDER BY c.gender_code;
