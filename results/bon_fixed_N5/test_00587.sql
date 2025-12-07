SELECT DISTINCT bo.ISBN
FROM Books_Order bo
JOIN Orders o ON bo.IdOrder = o.IdOrder
JOIN Client c ON o.IdClient = c.IdClient
WHERE c.Name IN ('Peter Doe', 'James Smith')
GROUP BY bo.ISBN
HAVING COUNT(DISTINCT c.Name) = 2;
