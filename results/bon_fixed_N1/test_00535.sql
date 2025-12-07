SELECT Book.ISBN, COUNT(DISTINCT Books_Order.IdOrder) AS NumberOfOrders
FROM Book
LEFT JOIN Books_Order ON Book.ISBN = Books_Order.ISBN
GROUP BY Book.ISBN;
