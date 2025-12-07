SELECT 
  o.order_id, 
  o.date_order_placed, 
  COALESCE(SUM(p.product_price), 0) AS total_amount_paid
FROM Orders o
LEFT JOIN Order_Items oi ON o.order_id = oi.order_id
LEFT JOIN Products p ON oi.product_id = p.product_id
GROUP BY o.order_id, o.date_order_placed
ORDER BY o.order_id;
