SELECT b.Title, a.Name AS Author_Name, p.Name AS Press_Name
FROM book b
JOIN author a ON b.Author_ID = a.Author_ID
JOIN press p ON b.Press_ID = p.Press_ID
ORDER BY CAST(REPLACE(b.Sale_Amount, ',', '') AS FLOAT) DESC
LIMIT 3;
