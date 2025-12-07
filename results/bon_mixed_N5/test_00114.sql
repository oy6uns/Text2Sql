SELECT i.invoice_number, i.invoice_date
FROM Invoices i
JOIN Shipments s ON i.invoice_number = s.invoice_number
GROUP BY i.invoice_number, i.invoice_date
HAVING COUNT(DISTINCT s.shipment_id) >= 2;
