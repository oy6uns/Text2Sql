SELECT customer_first_name, customer_middle_initial, customer_last_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
