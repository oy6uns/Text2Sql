SELECT date_order_placed
FROM Orders
WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders)
   OR order_id IN (
       SELECT order_id
       FROM Order_Items
       GROUP BY order_id
       HAVING COUNT(*) > 1
   )
