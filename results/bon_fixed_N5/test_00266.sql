SELECT product_type_code
FROM Products
GROUP BY product_type_code
HAVING COUNT(product_id) >= 2;
