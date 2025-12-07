SELECT Clients.client_id, COUNT(Invoices.invoice_id) AS number_of_invoices
FROM Clients
LEFT JOIN Invoices ON Clients.client_id = Invoices.client_id
GROUP BY Clients.client_id;
