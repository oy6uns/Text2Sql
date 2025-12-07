SELECT Title
FROM Book
LEFT JOIN Books_Order ON Book.ISBN = Books_Order.ISBN
WHERE Books_Order.IdOrder IS NULL;
