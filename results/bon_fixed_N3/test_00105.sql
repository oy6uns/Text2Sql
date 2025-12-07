SELECT AVG(product_price) AS average_product_price
FROM Products
WHERE product_id IN (
    SELECT DISTINCT product_id
    FROM Order_Items
);
