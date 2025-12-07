SELECT 
    p.product_id, 
    p.product_name, 
    p.product_price, 
    p.product_color
FROM Products p
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.product_price, p.product_color
HAVING COUNT(DISTINCT oi.order_id) < 2;
