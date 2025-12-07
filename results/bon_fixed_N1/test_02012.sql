SELECT a.Name, a.Gender
FROM author a
JOIN book b ON a.Author_ID = b.Author_ID
GROUP BY a.Author_ID, a.Name, a.Gender
ORDER BY COUNT(b.Book_ID) DESC
LIMIT 1;
