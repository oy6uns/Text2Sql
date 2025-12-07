SELECT DISTINCT i.invoice_id, i.invoice_status
FROM Invoices i
JOIN Payments p ON i.invoice_id = p.invoice_id;
