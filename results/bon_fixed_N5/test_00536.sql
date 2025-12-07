SELECT b.ISBN, COALESCE(SUM(bo.amount), 0) AS times_ordered
FROM Book b
LEFT JOIN Books_Order bo ON b.ISBN = bo.ISBN
GROUP BY b.ISBN;
