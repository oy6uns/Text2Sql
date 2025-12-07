SELECT date_order_placed
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, date_order_placed
HAVING date_order_placed = (SELECT MIN(date_order_placed) FROM Orders)
   OR COUNT(oi.order_item_id) > 1;
