SELECT customer_name, payment_method_code
FROM Customers
WHERE payment_method_code IN (
    SELECT payment_method_code
    FROM Customers
    GROUP BY payment_method_code
    HAVING COUNT(*) = (
        SELECT MIN(payment_count)
        FROM (
            SELECT COUNT(*) AS payment_count
            FROM Customers
            GROUP BY payment_method_code
        ) AS counts
    )
)
