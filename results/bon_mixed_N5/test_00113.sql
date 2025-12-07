SELECT product_id, product_description
FROM Products
WHERE product_id IN (
    SELECT product_id
    FROM Order_Items
    GROUP BY product_id
    HAVING COUNT(*) > 3
)
