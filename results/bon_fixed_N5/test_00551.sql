SELECT c.Name, SUM(b.SalePrice * bo.amount) AS TotalAmount
FROM Client c
JOIN Orders o ON c.IdClient = o.IdClient
JOIN Books_Order bo ON o.IdOrder = bo.IdOrder
JOIN Book b ON bo.ISBN = b.ISBN
GROUP BY c.Name;
