SELECT Title
FROM Book
WHERE ISBN IN (
    SELECT ISBN
    FROM Author_Book
    WHERE Author = (
        SELECT idAuthor
        FROM Author
        WHERE Name = 'George Orwell'
    )
)
ORDER BY SalePrice
LIMIT 1;
