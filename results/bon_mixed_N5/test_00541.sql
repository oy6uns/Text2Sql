SELECT b.Title, b.PurchasePrice
FROM Book b
JOIN (
    SELECT bo.ISBN, SUM(bo.amount) AS total_amount
    FROM Books_Order bo
    GROUP BY bo.ISBN
    ORDER BY total_amount DESC
    LIMIT 1
) AS top_book ON b.ISBN = top_book.ISBN;
