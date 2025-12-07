SELECT product_type_code, COUNT(*) AS product_count
FROM Products
GROUP BY product_type_code;
