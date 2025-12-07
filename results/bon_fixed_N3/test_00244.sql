SELECT 
  MIN(product_price) AS min_price, 
  AVG(product_price) AS avg_price, 
  MAX(product_price) AS max_price 
FROM Products;
