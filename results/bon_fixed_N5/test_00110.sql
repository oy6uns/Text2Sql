SELECT order_status_code
FROM Orders
GROUP BY order_status_code
ORDER BY COUNT(*) ASC
LIMIT 1;
