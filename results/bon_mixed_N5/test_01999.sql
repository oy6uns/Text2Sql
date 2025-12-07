SELECT Name, Age
FROM author a
LEFT JOIN book b ON a.Author_ID = b.Author_ID
WHERE b.Book_ID IS NULL;
