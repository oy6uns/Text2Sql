SELECT order_status_code, COUNT(*) AS order_count
FROM Customer_Orders
GROUP BY order_status_code;
