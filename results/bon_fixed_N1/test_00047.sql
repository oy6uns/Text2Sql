SELECT customer_first_name, customer_last_name, customer_middle_initial
FROM Customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Orders)
