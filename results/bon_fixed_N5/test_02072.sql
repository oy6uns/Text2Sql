SELECT DISTINCT a.agency_details
FROM Agencies a
JOIN Clients c ON a.agency_id = c.agency_id
WHERE c.client_details LIKE '%Mac%'
