SELECT customer_name, payment_method_code
FROM Customers
WHERE payment_method_code = (
    SELECT payment_method_code
    FROM Customers
    GROUP BY payment_method_code
    ORDER BY COUNT(*) ASC
    LIMIT 1
);
