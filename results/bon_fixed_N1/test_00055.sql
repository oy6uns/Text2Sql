SELECT 
    o.order_id, 
    SUM(p.product_price) AS total_cost
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY o.order_id
ORDER BY total_cost ASC
LIMIT 1;
