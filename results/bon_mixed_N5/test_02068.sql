SELECT a.agency_id, a.agency_details
FROM Agencies a
JOIN (
    SELECT agency_id, COUNT(*) AS client_count
    FROM Clients
    GROUP BY agency_id
    ORDER BY client_count DESC
    LIMIT 1
) c ON a.agency_id = c.agency_id
