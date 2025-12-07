SELECT sic_code, COUNT(*) AS client_count
FROM Clients
GROUP BY sic_code;
