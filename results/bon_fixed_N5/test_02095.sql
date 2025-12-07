SELECT invoice_status
FROM Invoices
GROUP BY invoice_status
ORDER BY COUNT(*) DESC
LIMIT 1;
