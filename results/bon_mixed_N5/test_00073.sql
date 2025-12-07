SELECT DISTINCT p.product_name, p.product_price, p.product_description
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
JOIN Orders o ON oi.order_id = o.order_id
JOIN Customers c ON o.customer_id = c.customer_id
WHERE c.gender_code = 'F'
