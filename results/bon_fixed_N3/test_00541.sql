SELECT b.Title, b.PurchasePrice
FROM Book b
JOIN Books_Order bo ON b.ISBN = bo.ISBN
GROUP BY b.ISBN, b.Title, b.PurchasePrice
ORDER BY SUM(bo.amount) DESC
LIMIT 1;
