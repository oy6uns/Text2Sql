SELECT c.Name, COALESCE(SUM(bo.amount), 0) AS total_books_ordered
FROM Client c
LEFT JOIN Orders o ON c.IdClient = o.IdClient
LEFT JOIN Books_Order bo ON o.IdOrder = bo.IdOrder
GROUP BY c.Name;
