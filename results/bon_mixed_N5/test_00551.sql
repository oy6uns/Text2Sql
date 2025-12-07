SELECT c.Name, COALESCE(SUM(b.amount), 0) AS TotalBooksOrdered
FROM Client c
LEFT JOIN Orders o ON c.IdClient = o.IdClient
LEFT JOIN Books_Order b ON o.IdOrder = b.IdOrder
GROUP BY c.Name;
