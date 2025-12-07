SELECT DISTINCT Client.Name
FROM Client
JOIN Orders ON Client.IdClient = Orders.IdClient;
