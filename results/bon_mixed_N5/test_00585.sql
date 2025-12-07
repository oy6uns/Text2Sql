SELECT o.IdOrder
FROM Orders o
JOIN Books_Order bo1 ON o.IdOrder = bo1.IdOrder
JOIN Book b1 ON bo1.ISBN = b1.ISBN
JOIN Books_Order bo2 ON o.IdOrder = bo2.IdOrder
JOIN Book b2 ON bo2.ISBN = b2.ISBN
WHERE b1.Title = 'Pride and Prejudice'
  AND b2.Title = 'The Little Prince'
GROUP BY o.IdOrder;
