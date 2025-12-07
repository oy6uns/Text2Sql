SELECT DISTINCT Client.Name
FROM Client
JOIN Orders ON Client.IdClient = Orders.IdClient
JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder
JOIN Book ON Books_Order.ISBN = Book.ISBN
WHERE Book.Title = 'Pride and Prejudice'
