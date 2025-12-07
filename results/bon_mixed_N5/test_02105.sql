SELECT invoice_id, invoice_status
FROM Invoices
WHERE invoice_id NOT IN (SELECT invoice_id FROM Payments);
