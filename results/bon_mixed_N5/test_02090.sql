SELECT client_id, client_details
FROM Clients
WHERE client_id = (
    SELECT client_id
    FROM Invoices
    GROUP BY client_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
