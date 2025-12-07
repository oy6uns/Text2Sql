SELECT payment_method_code, COUNT(*) AS customer_count FROM Customers GROUP BY payment_method_code;
