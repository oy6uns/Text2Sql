SELECT DISTINCT b1.ISBN
FROM Books_Order b1
JOIN Orders o1 ON b1.IdOrder = o1.IdOrder
JOIN Client c1 ON o1.IdClient = c1.IdClient
WHERE c1.Name = 'Peter Doe'
AND b1.ISBN IN (
    SELECT b2.ISBN
    FROM Books_Order b2
    JOIN Orders o2 ON b2.IdOrder = o2.IdOrder
    JOIN Client c2 ON o2.IdClient = c2.IdClient
    WHERE c2.Name = 'James Smith'
)
