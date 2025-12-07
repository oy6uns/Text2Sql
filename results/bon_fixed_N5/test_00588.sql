SELECT DISTINCT b.ISBN
FROM Book b
JOIN Books_Order bo ON b.ISBN = bo.ISBN
JOIN Orders o ON bo.IdOrder = o.IdOrder
JOIN Client c ON o.IdClient = c.IdClient
WHERE c.Name IN ('Peter Doe', 'James Smith')
GROUP BY b.ISBN
HAVING COUNT(DISTINCT c.Name) = 2;
