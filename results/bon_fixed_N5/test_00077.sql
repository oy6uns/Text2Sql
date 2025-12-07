SELECT 
  o.order_id, 
  o.date_order_placed AS order_date, 
  SUM(p.product_price) AS total_amount_paid
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY o.order_id, o.date_order_placed
ORDER BY o.order_id;
