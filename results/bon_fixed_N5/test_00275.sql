SELECT payment_method_code, COUNT(*) AS number_of_customers
FROM Customers
GROUP BY payment_method_code;
