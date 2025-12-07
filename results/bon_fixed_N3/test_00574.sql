SELECT DISTINCT Book.SalePrice
FROM Book
JOIN Author_Book ON Book.ISBN = Author_Book.ISBN
JOIN Author ON Author_Book.Author = Author.idAuthor
WHERE Author.Name = 'Plato'
