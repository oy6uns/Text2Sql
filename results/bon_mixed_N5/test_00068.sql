SELECT oi.order_item_status_code, s.shipment_tracking_number
FROM Order_Items oi
JOIN Shipment_Items si ON oi.order_item_id = si.order_item_id
JOIN Shipments s ON si.shipment_id = s.shipment_id;
