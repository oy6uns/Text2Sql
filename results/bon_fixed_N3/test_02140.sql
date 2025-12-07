SELECT DISTINCT c.client_id, c.client_details
FROM Clients c
LEFT JOIN Meetings m ON c.client_id = m.client_id
LEFT JOIN Invoices i ON c.client_id = i.client_id
WHERE m.meeting_id IS NOT NULL OR i.invoice_id IS NOT NULL;
