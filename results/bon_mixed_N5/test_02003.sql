SELECT b.Title, a.Name AS Author_Name, p.Name AS Publisher_Name
FROM book b
JOIN author a ON b.Author_ID = a.Author_ID
JOIN press p ON b.Press_ID = p.Press_ID
ORDER BY CAST(REPLACE(b.Sale_Amount, ',', '') AS NUMBER) DESC
LIMIT 3;
