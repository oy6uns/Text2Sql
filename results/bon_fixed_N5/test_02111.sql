SELECT DISTINCT Invoices.invoice_id, Invoices.invoice_status
FROM Invoices
JOIN Payments ON Invoices.invoice_id = Payments.invoice_id;
