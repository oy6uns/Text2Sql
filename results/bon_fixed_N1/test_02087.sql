SELECT client_id, COUNT(invoice_id) AS number_of_invoices
FROM Invoices
GROUP BY client_id;
