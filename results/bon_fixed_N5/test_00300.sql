SELECT order_status_code
FROM Customer_Orders
GROUP BY order_status_code
ORDER BY COUNT(*) DESC
LIMIT 1;
