SELECT invoice_status, COUNT(*) AS number_of_invoices
FROM Invoices
GROUP BY invoice_status;
