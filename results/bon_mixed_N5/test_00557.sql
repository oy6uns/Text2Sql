SELECT Name
FROM Client
LEFT JOIN Orders ON Client.IdClient = Orders.IdClient
WHERE Orders.IdOrder IS NULL;
