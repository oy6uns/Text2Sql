SELECT 
  o.order_id,
  o.order_status_code,
  COUNT(oi.product_id) AS product_count
FROM Orders o
LEFT JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.order_status_code
ORDER BY o.order_id;
