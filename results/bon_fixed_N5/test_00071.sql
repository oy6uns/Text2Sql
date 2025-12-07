SELECT DISTINCT p.product_name, p.product_color
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
JOIN Shipment_Items si ON oi.order_item_id = si.order_item_id;
