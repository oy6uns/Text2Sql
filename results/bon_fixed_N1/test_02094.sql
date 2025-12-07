SELECT invoice_status, COUNT(*) AS invoice_count
FROM Invoices
GROUP BY invoice_status
ORDER BY invoice_status;
