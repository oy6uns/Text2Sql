SELECT payment_method_code, COUNT(DISTINCT customer_id) AS customer_count
FROM Customers
GROUP BY payment_method_code;
