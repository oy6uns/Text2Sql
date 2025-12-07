SELECT c.client_id, c.sic_code, c.agency_id
FROM Clients c
JOIN Meetings m ON c.client_id = m.client_id
JOIN Invoices i ON c.client_id = i.client_id
GROUP BY c.client_id, c.sic_code, c.agency_id
HAVING COUNT(DISTINCT m.meeting_id) = 1;
