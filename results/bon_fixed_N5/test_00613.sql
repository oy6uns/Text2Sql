SELECT b.Type, b.Title
FROM book b
LEFT JOIN review r ON b.Book_ID = r.Book_ID
WHERE r.Rating IS NULL;
