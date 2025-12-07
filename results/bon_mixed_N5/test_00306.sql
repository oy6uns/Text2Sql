SELECT COUNT(*) AS total_monitor_orders
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
WHERE p.product_type_code = 'Monitor';
