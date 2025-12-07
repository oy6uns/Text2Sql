SELECT DISTINCT co.order_id, co.order_date
FROM Customer_Orders co
JOIN Order_Items oi ON co.order_id = oi.order_id
WHERE CAST(oi.order_quantity AS INTEGER) > 6
OR co.order_id IN (
    SELECT order_id
    FROM Order_Items
    GROUP BY order_id
    HAVING COUNT(DISTINCT product_id) > 3
)
