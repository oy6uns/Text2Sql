SELECT AVG(p.product_price) AS average_product_price
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id;
