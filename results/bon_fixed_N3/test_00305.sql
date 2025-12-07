SELECT COALESCE(SUM(CAST(oi.order_quantity AS INTEGER)), 0) AS total_monitors_ordered
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
WHERE p.product_name = 'Monitor';
