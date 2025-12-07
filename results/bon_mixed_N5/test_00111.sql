SELECT order_status_code
FROM Orders
GROUP BY order_status_code
HAVING COUNT(*) = (
    SELECT MIN(status_count) FROM (
        SELECT COUNT(*) AS status_count
        FROM Orders
        GROUP BY order_status_code
    ) AS counts
)
