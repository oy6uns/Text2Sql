SELECT c.client_id, c.client_details
FROM Clients c
JOIN (
    SELECT client_id, COUNT(*) AS invoice_count
    FROM Invoices
    GROUP BY client_id
) i ON c.client_id = i.client_id
WHERE i.invoice_count = (
    SELECT MAX(invoice_count)
    FROM (
        SELECT client_id, COUNT(*) AS invoice_count
        FROM Invoices
        GROUP BY client_id
    ) sub
)
