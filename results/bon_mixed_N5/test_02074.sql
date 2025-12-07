SELECT c.client_details, a.agency_details
FROM Clients c
JOIN Agencies a ON c.agency_id = a.agency_id;
