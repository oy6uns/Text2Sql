SELECT r.Rank
FROM book b
JOIN review r ON b.Book_ID = r.Book_ID
WHERE b.Pages = (SELECT MIN(Pages) FROM book);
