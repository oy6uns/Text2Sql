SELECT agency_id, agency_details
FROM Agencies
WHERE agency_id IN (
    SELECT agency_id
    FROM Clients
    GROUP BY agency_id
    HAVING COUNT(client_id) >= 2
)
