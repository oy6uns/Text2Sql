SELECT b.Title, b.Audio
FROM book b
JOIN review r ON b.Book_ID = r.Book_ID
ORDER BY r.Readers_in_Million DESC;
