SELECT COUNT(DISTINCT oi.product_id)
FROM Order_Items oi
JOIN Shipment_Items si ON oi.order_item_id = si.order_item_id;
