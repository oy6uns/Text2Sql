SELECT COUNT(DISTINCT bo.IdOrder)
FROM Books_Order bo
JOIN Book b ON bo.ISBN = b.ISBN
WHERE b.Title = 'Pride and Prejudice';
