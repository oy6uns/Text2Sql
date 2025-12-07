SELECT b.Title, b.PurchasePrice
FROM Book b
JOIN (
    SELECT bo.ISBN, SUM(bo.amount) AS total_amount
    FROM Books_Order bo
    GROUP BY bo.ISBN
) AS totals ON b.ISBN = totals.ISBN
WHERE totals.total_amount = (
    SELECT MAX(t.total_amount)
    FROM (
        SELECT SUM(amount) AS total_amount
        FROM Books_Order
        GROUP BY ISBN
    ) AS t
)
