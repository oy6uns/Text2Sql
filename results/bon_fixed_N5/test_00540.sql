SELECT b.Title
FROM Book b
JOIN Books_Order bo ON b.ISBN = bo.ISBN
GROUP BY b.Title
ORDER BY SUM(bo.amount) DESC
LIMIT 1;
