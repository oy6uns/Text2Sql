SELECT DISTINCT a.agency_id, a.agency_details
FROM Agencies a
JOIN Clients c ON a.agency_id = c.agency_id;
