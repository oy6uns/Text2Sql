SELECT Client.Name
FROM Client
JOIN Orders ON Client.IdClient = Orders.IdClient
JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder
GROUP BY Client.Name
ORDER BY SUM(Books_Order.amount) DESC
LIMIT 1;
