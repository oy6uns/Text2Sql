SELECT 
  p.product_id, 
  p.product_name, 
  p.product_price
FROM 
  Products p
JOIN 
  Order_Items oi ON p.product_id = oi.product_id
GROUP BY 
  p.product_id, p.product_name, p.product_price
ORDER BY 
  COUNT(oi.order_item_id) DESC
LIMIT 1;
