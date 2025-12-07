SELECT product_id, product_name, product_price, product_color
FROM Products
WHERE product_id IN (
    SELECT product_id
    FROM Order_Items
    GROUP BY product_id
    HAVING COUNT(DISTINCT order_id) < 2
)
OR product_id NOT IN (SELECT DISTINCT product_id FROM Order_Items)
