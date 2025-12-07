SELECT DISTINCT Book.Title
FROM Book
JOIN Books_Order ON Book.ISBN = Books_Order.ISBN;
