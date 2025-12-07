SELECT order_id, SUM(p.product_price) AS total_price
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY order_id
ORDER BY total_price
LIMIT 1;
