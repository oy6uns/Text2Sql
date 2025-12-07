SELECT product_type_code, COUNT(*) AS number_of_products
FROM Products
GROUP BY product_type_code;
