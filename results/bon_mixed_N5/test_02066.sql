SELECT agency_id, COUNT(client_id) AS client_count
FROM Clients
GROUP BY agency_id;
