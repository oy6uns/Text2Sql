SELECT c.client_id, c.client_details
FROM Clients c
JOIN Invoices i ON c.client_id = i.client_id
GROUP BY c.client_id, c.client_details
ORDER BY COUNT(i.invoice_id) DESC
LIMIT 1;
