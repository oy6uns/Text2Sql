SELECT DISTINCT bo.ISBN
FROM Books_Order bo
JOIN Orders o ON bo.IdOrder = o.IdOrder
JOIN Client c ON o.IdClient = c.IdClient
WHERE c.Name = 'Peter Doe'
INTERSECT
SELECT DISTINCT bo.ISBN
FROM Books_Order bo
JOIN Orders o ON bo.IdOrder = o.IdOrder
JOIN Client c ON o.IdClient = c.IdClient
WHERE c.Name = 'James Smith'
