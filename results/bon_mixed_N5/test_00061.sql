SELECT c.gender_code, COUNT(DISTINCT o.order_id) AS order_count
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.gender_code;
