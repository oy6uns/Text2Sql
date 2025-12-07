SELECT DISTINCT i.invoice_status_code
FROM Invoices i
JOIN Shipments s ON i.invoice_number = s.invoice_number
RIGHT JOIN Orders o ON s.order_id = o.order_id
WHERE s.shipment_id IS NULL;
