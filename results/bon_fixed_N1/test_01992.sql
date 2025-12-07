SELECT Book_Series, COUNT(*) AS book_count
FROM book
GROUP BY Book_Series;
