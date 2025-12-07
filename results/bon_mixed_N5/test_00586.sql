SELECT bo1.IdOrder
FROM Books_Order bo1
JOIN Book b1 ON bo1.ISBN = b1.ISBN
JOIN Books_Order bo2 ON bo1.IdOrder = bo2.IdOrder
JOIN Book b2 ON bo2.ISBN = b2.ISBN
WHERE b1.Title = 'Pride and Prejudice'
  AND b2.Title = 'The Little Prince';
