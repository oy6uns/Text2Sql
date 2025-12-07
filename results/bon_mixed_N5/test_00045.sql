SELECT 
  (SELECT MIN(date_order_placed) FROM Orders) AS earliest_order_date,
  date_order_placed
FROM Orders
WHERE order_id IN (
  SELECT order_id
  FROM Order_Items
  GROUP BY order_id
  HAVING COUNT(order_item_id) > 1
)
ORDER BY date_order_placed;
