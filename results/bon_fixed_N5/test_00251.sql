SELECT product_name
FROM Products
WHERE product_type_code = 'hardware'
  AND product_price > (
    SELECT AVG(product_price)
    FROM Products
    WHERE product_type_code = 'hardware'
);
