SELECT Name
FROM author
WHERE Author_ID IN (
    SELECT Author_ID FROM book WHERE Book_Series = 'MM'
    INTERSECT
    SELECT Author_ID FROM book WHERE Book_Series = 'LT'
)
