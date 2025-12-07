SELECT product_type_code
FROM Products
GROUP BY product_type_code
ORDER BY COUNT(product_id) ASC
LIMIT 1;
