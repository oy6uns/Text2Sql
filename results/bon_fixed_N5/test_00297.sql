SELECT order_status_code, COUNT(*) AS number_of_orders
FROM Customer_Orders
GROUP BY order_status_code;
