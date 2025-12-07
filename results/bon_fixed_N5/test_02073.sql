SELECT Clients.client_details, Agencies.agency_details
FROM Clients
JOIN Agencies ON Clients.agency_id = Agencies.agency_id;
