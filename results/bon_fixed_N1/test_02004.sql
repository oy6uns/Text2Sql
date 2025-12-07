SELECT b.Title, a.Name AS Author_Name, p.Name AS Press_Name
FROM book b
JOIN author a ON b.Author_ID = a.Author_ID
JOIN press p ON b.Press_ID = p.Press_ID
ORDER BY TRY_TO_NUMBER(REPLACE(b.Sale_Amount, ',', '')) DESC
LIMIT 3;
