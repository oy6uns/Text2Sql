SELECT order_status_code AS order_status, COUNT(*) AS number_of_orders
FROM Customer_Orders
GROUP BY order_status_code;
