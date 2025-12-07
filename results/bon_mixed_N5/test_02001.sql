SELECT a.Name
FROM author a
JOIN book b ON a.Author_ID = b.Author_ID
GROUP BY a.Author_ID, a.Name
HAVING COUNT(b.Book_ID) > 1;
