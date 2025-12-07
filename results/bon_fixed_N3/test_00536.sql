SELECT Book.ISBN, COALESCE(SUM(Books_Order.amount), 0) AS times_ordered
FROM Book
LEFT JOIN Books_Order ON Book.ISBN = Books_Order.ISBN
GROUP BY Book.ISBN;
