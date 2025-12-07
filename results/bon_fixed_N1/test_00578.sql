SELECT Title
FROM Book
WHERE Title IN (
    SELECT b.Title
    FROM Book b
    JOIN Author_Book ab ON b.ISBN = ab.ISBN
    JOIN Author a ON ab.Author = a.idAuthor
    WHERE a.Name = 'Plato'
)
AND SalePrice < (SELECT AVG(SalePrice) FROM Book)
