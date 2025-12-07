SELECT 
  order_id, 
  order_status_code, 
  COUNT(product_id) AS product_count 
FROM Orders 
JOIN Order_Items USING(order_id) 
GROUP BY order_id, order_status_code;
