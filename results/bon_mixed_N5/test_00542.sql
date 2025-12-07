SELECT b.Title, b.PurchasePrice
FROM Book b
JOIN (
    SELECT bo.ISBN, SUM(bo.amount) AS total_amount
    FROM Books_Order bo
    GROUP BY bo.ISBN
    ORDER BY total_amount DESC
    LIMIT 1
) t ON b.ISBN = t.ISBN;
