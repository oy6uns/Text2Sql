SELECT COUNT(DISTINCT co.customer_id)
FROM Customer_Orders co
JOIN Order_Items oi ON co.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE p.product_type_code = 'Monitor'
