SELECT Orders.order_id, Orders.order_status_code, COUNT(Order_Items.product_id) AS product_count
FROM Orders
JOIN Order_Items ON Orders.order_id = Order_Items.order_id
GROUP BY Orders.order_id, Orders.order_status_code;
