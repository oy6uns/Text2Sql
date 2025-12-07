SELECT 
  i.invoice_status_code AS invoice_status,
  i.invoice_date AS invoice_date,
  s.shipment_date AS shipment_date
FROM Invoices i
LEFT JOIN Shipments s ON i.invoice_number = s.invoice_number;
