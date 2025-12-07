SELECT COUNT(*) 
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
WHERE p.product_name = 'Monitor';
