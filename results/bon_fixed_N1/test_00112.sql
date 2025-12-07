SELECT p.product_id, p.product_description
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_description
HAVING COUNT(oi.order_item_id) > 3;
