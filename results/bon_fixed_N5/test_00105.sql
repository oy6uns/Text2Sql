SELECT AVG(product_price) AS average_product_price
FROM Order_Items
JOIN Products ON Order_Items.product_id = Products.product_id;
