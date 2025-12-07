SELECT order_id, date_order_placed
FROM Orders
WHERE order_id IN (
    SELECT order_id
    FROM Order_Items
    GROUP BY order_id
    HAVING COUNT(DISTINCT product_id) >= 2
)
