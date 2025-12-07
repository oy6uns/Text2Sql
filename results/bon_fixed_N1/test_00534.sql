SELECT a.Name, COUNT(ab.ISBN) AS NumberOfBooks
FROM Author a
LEFT JOIN Author_Book ab ON a.idAuthor = ab.Author
GROUP BY a.Name
ORDER BY a.Name;
