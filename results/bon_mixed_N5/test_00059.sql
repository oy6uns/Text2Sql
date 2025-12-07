SELECT 
    c.gender_code,
    COUNT(DISTINCT oi.product_id) AS product_count
FROM 
    Customers c
JOIN 
    Orders o ON c.customer_id = o.customer_id
JOIN 
    Order_Items oi ON o.order_id = oi.order_id
GROUP BY 
    c.gender_code;
