SELECT COUNT(*) 
FROM Products p
WHERE NOT EXISTS (
    SELECT 1 
    FROM Order_Items oi 
    WHERE oi.product_id = p.product_id
)
