SELECT p.product_id, p.product_name, p.product_price
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.product_price
HAVING COUNT(*) = (
    SELECT MAX(product_count) FROM (
        SELECT COUNT(*) AS product_count
        FROM Order_Items
        GROUP BY product_id
    ) sub
)
