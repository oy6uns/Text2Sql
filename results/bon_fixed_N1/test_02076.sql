SELECT sic_code, COUNT(client_id) AS client_count
FROM Clients
GROUP BY sic_code;
