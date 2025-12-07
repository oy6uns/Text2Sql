SELECT Name
FROM author
WHERE Author_ID NOT IN (
    SELECT Author_ID
    FROM book
    WHERE Press_ID = (
        SELECT Press_ID
        FROM press
        WHERE Name = 'Accor'
    )
)
