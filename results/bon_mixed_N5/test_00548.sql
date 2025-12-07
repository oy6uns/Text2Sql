SELECT c.Name, COUNT(o.IdOrder) AS OrderCount
FROM Client c
LEFT JOIN Orders o ON c.IdClient = o.IdClient
GROUP BY c.Name;
