SELECT c.gender_code, COUNT(DISTINCT o.order_id) AS number_of_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.gender_code
ORDER BY c.gender_code;
