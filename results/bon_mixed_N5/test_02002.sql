SELECT Name
FROM author
WHERE Author_ID IN (
    SELECT Author_ID
    FROM book
    GROUP BY Author_ID
    HAVING COUNT(*) > 1
)
