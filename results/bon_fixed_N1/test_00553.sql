SELECT c.Name
FROM Client c
JOIN Orders o ON c.IdClient = o.IdClient
JOIN Books_Order bo ON o.IdOrder = bo.IdOrder
GROUP BY c.Name
ORDER BY SUM(bo.amount) DESC
LIMIT 1;
