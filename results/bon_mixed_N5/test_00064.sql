SELECT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date
FROM Invoices
LEFT JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number;
