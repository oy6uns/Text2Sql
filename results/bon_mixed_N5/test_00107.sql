SELECT email_address, town_city, county
FROM Customers
WHERE gender_code = (
    SELECT gender_code
    FROM (
        SELECT c.gender_code, COUNT(o.order_id) AS order_count
        FROM Customers c
        LEFT JOIN Orders o ON c.customer_id = o.customer_id
        GROUP BY c.gender_code
        ORDER BY order_count ASC
        LIMIT 1
    ) AS gender_orders
)
