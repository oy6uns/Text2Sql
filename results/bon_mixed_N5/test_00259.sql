SELECT product_id, product_type_code, product_name, product_price
FROM Products
WHERE product_type_code = 'hardware'
ORDER BY product_price ASC;
