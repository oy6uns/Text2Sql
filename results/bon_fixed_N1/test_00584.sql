SELECT COUNT(*) 
FROM Orders o
JOIN Books_Order bo ON o.IdOrder = bo.IdOrder
JOIN Book b ON bo.ISBN = b.ISBN
WHERE b.Title = 'Pride and Prejudice';
