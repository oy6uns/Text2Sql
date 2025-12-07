SELECT p.product_id, p.product_name, p.product_price
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.product_price
HAVING COUNT(oi.order_item_id) = (
    SELECT MAX(product_count) FROM (
        SELECT COUNT(oi2.order_item_id) AS product_count
        FROM Order_Items oi2
        GROUP BY oi2.product_id
    ) sub
)
