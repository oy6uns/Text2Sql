SELECT product_type_code, AVG(product_price) AS average_price
FROM Products
GROUP BY product_type_code;
