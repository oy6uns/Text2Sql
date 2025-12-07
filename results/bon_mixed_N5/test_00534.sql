SELECT Author.Name, COUNT(Author_Book.ISBN) AS NumberOfBooks
FROM Author
LEFT JOIN Author_Book ON Author.idAuthor = Author_Book.Author
GROUP BY Author.Name
ORDER BY Author.Name;
