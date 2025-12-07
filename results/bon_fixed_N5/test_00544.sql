SELECT DISTINCT b.Title
FROM Book b
JOIN Books_Order bo ON b.ISBN = bo.ISBN
JOIN Orders o ON bo.IdOrder = o.IdOrder
WHERE o.DateOrder < CURRENT_TIMESTAMP;
