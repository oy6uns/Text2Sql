SELECT DISTINCT b.Title
FROM Book b
JOIN Books_Order bo ON b.ISBN = bo.ISBN
JOIN Orders o ON bo.IdOrder = o.IdOrder
JOIN Client c ON o.IdClient = c.IdClient
WHERE c.Name = 'Peter Doe'
AND b.ISBN NOT IN (
    SELECT b2.ISBN
    FROM Book b2
    JOIN Books_Order bo2 ON b2.ISBN = bo2.ISBN
    JOIN Orders o2 ON bo2.IdOrder = o2.IdOrder
    JOIN Client c2 ON o2.IdClient = c2.IdClient
    WHERE c2.Name = 'James Smith'
)
