SELECT DISTINCT o.date_order_placed
FROM Orders o
LEFT JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.date_order_placed
HAVING o.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders)
   OR COUNT(oi.order_item_id) > 1;
