SELECT agency_id, agency_details
FROM Agencies
WHERE agency_id = (
    SELECT agency_id
    FROM Clients
    GROUP BY agency_id
    ORDER BY COUNT(client_id) DESC
    LIMIT 1
)
