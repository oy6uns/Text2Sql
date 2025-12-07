SELECT DISTINCT i.invoice_status_code
FROM Invoices i
JOIN Shipments s ON i.invoice_number = s.invoice_number
RIGHT JOIN Orders o ON o.order_id = s.order_id
WHERE o.order_id NOT IN (SELECT order_id FROM Shipments)
OR s.shipment_id IS NULL;
