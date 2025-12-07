SELECT r.Rating
FROM book b
JOIN review r ON b.Book_ID = r.Book_ID
WHERE b.Chapters = (SELECT MAX(Chapters) FROM book)
