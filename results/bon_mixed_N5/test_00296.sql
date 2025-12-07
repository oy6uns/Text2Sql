SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email
FROM Customers c
JOIN (
    SELECT customer_id, COUNT(*) AS order_count
    FROM Customer_Orders
    GROUP BY customer_id
    ORDER BY order_count DESC
    LIMIT 1
) co ON c.customer_id = co.customer_id;
