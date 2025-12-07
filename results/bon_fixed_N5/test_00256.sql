SELECT product_id, product_name
FROM Products
WHERE product_type_code = 'Hardware'
ORDER BY product_price
LIMIT 1;
