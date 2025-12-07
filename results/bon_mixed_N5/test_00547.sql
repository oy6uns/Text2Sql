SELECT Client.Name, COUNT(Orders.IdOrder) AS NumberOfOrders
FROM Client
LEFT JOIN Orders ON Client.IdClient = Orders.IdClient
GROUP BY Client.Name;
