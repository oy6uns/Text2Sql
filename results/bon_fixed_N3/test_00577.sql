SELECT Title
FROM Book
WHERE ISBN IN (
    SELECT ISBN
    FROM Author_Book ab
    JOIN Author a ON ab.Author = a.idAuthor
    WHERE a.Name = 'Plato'
)
AND SalePrice < (SELECT AVG(SalePrice) FROM Book)
