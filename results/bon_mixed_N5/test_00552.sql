SELECT Client.Name, COALESCE(SUM(Books_Order.amount), 0) AS TotalBooksOrdered
FROM Client
LEFT JOIN Orders ON Client.IdClient = Orders.IdClient
LEFT JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder
GROUP BY Client.Name;
