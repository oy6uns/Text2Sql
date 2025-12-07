SELECT client_id
FROM Invoices
GROUP BY client_id
HAVING COUNT(invoice_id) >= 2;
