SELECT Client.Name, COALESCE(SUM(Book.SalePrice * Books_Order.amount), 0) AS TotalAmount
FROM Client
LEFT JOIN Orders ON Client.IdClient = Orders.IdClient
LEFT JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder
LEFT JOIN Book ON Books_Order.ISBN = Book.ISBN
GROUP BY Client.Name;
