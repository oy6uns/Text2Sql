SELECT p.product_id, p.product_name, p.product_price
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.product_price
ORDER BY COUNT(*) DESC
LIMIT 1;
