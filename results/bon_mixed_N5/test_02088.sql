SELECT client_id, COUNT(invoice_id) AS invoice_count FROM Invoices GROUP BY client_id;
