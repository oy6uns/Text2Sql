SELECT Name, Gender
FROM author
WHERE Author_ID = (
    SELECT Author_ID
    FROM book
    GROUP BY Author_ID
    ORDER BY COUNT(*) DESC
    LIMIT 1
);
