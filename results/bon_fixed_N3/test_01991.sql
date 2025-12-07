SELECT Book_Series, COUNT(*) AS Number_of_Books
FROM book
GROUP BY Book_Series;
