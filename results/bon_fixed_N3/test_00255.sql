SELECT product_id, product_name
FROM Products
WHERE product_type_code = 'Hardware'
ORDER BY product_price ASC
LIMIT 1;
