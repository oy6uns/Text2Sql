SELECT DISTINCT b.ISBN
FROM Books_Order b
JOIN Orders o ON b.IdOrder = o.IdOrder
JOIN Client c ON o.IdClient = c.IdClient
WHERE c.Name IN ('Peter Doe', 'James Smith')
GROUP BY b.ISBN
HAVING COUNT(DISTINCT c.Name) = 2;
