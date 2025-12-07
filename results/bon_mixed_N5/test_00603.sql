SELECT b.Title
FROM book b
JOIN review r ON b.Book_ID = r.Book_ID
ORDER BY r.Rank ASC
LIMIT 1;
