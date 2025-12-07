SELECT Client.Name, SUM(Book.SalePrice * Books_Order.amount) AS TotalAmount
FROM Client
JOIN Orders ON Client.IdClient = Orders.IdClient
JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder
JOIN Book ON Books_Order.ISBN = Book.ISBN
GROUP BY Client.Name;
