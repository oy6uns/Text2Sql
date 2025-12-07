SELECT customer_name, payment_method_code
FROM Customers
WHERE payment_method_code = (
    SELECT payment_method_code
    FROM Customers
    GROUP BY payment_method_code
    ORDER BY COUNT(DISTINCT customer_id) ASC
    LIMIT 1
)
