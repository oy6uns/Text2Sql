SELECT agency_id, COUNT(client_id) AS number_of_clients
FROM Clients
GROUP BY agency_id;
