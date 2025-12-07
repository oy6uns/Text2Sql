SELECT o1.IdOrder
FROM Books_Order o1
JOIN Book b1 ON o1.ISBN = b1.ISBN
JOIN Books_Order o2 ON o1.IdOrder = o2.IdOrder
JOIN Book b2 ON o2.ISBN = b2.ISBN
WHERE b1.Title = 'Pride and Prejudice' AND b2.Title = 'The Little Prince';
