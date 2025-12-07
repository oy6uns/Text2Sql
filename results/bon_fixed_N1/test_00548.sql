SELECT Client.Name, COUNT(Orders.IdOrder) AS OrderCount
FROM Client
LEFT JOIN Orders ON Client.IdClient = Orders.IdClient
GROUP BY Client.Name;
