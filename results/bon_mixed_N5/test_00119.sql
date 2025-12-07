SELECT product_color, product_description, product_size
FROM Products
WHERE product_price < (SELECT MAX(product_price) FROM Products);
