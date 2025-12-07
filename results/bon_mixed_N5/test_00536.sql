SELECT Book.ISBN, COUNT(Books_Order.IdOrder) AS times_ordered
FROM Book
LEFT JOIN Books_Order ON Book.ISBN = Books_Order.ISBN
GROUP BY Book.ISBN;
