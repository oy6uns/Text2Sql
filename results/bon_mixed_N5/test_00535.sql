SELECT b.ISBN, COUNT(DISTINCT bo.IdOrder) AS NumberOfOrders
FROM Book b
LEFT JOIN Books_Order bo ON b.ISBN = bo.ISBN
GROUP BY b.ISBN;
