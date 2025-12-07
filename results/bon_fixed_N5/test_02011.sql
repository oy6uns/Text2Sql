SELECT a.Name, a.Gender
FROM author a
JOIN (
    SELECT Author_ID, COUNT(*) AS book_count
    FROM book
    GROUP BY Author_ID
    ORDER BY book_count DESC
    LIMIT 1
) b ON a.Author_ID = b.Author_ID;
