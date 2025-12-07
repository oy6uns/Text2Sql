SELECT i.invoice_status_code, i.invoice_date, s.shipment_date
FROM Invoices i
LEFT JOIN Shipments s ON i.invoice_number = s.invoice_number;
