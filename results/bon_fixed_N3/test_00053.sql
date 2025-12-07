SELECT 
    p.product_id, 
    p.product_name, 
    p.product_price
FROM 
    Products p
JOIN 
    Order_Items oi ON p.product_id = oi.product_id
GROUP BY 
    p.product_id, p.product_name, p.product_price
HAVING 
    COUNT(oi.order_item_id) = (
        SELECT 
            MAX(product_order_count)
        FROM (
            SELECT 
                COUNT(order_item_id) AS product_order_count
            FROM 
                Order_Items
            GROUP BY 
                product_id
        ) sub
    )
