SELECT AVG(r.Readers_in_Million) AS average_readers
FROM book b
JOIN review r ON b.Book_ID = r.Book_ID
WHERE b.Type = 'Novel';
