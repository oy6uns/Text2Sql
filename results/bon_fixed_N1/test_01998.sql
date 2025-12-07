SELECT DISTINCT a.Name
FROM author a
JOIN book b ON a.Author_ID = b.Author_ID
WHERE b.Book_Series = 'MM'
AND a.Author_ID IN (
    SELECT Author_ID
    FROM book
    WHERE Book_Series = 'LT'
)
