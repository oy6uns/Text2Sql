SELECT o.order_id, o.date_order_placed
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.date_order_placed
HAVING COUNT(DISTINCT oi.product_id) >= 2;
