SELECT product_name
FROM Products
WHERE product_price > (SELECT AVG(product_price) FROM Products)
