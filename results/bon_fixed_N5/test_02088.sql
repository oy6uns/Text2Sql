SELECT client_id, COUNT(*) AS invoice_count
FROM Invoices
GROUP BY client_id;
