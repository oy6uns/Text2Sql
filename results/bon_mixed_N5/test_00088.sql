SELECT product_price, product_size
FROM Products
WHERE product_price > (SELECT AVG(product_price) FROM Products)
