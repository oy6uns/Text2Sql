SELECT sic_code, COUNT(client_id) AS number_of_clients
FROM Clients
GROUP BY sic_code;
