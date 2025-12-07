SELECT a.Name
FROM book b
JOIN author a ON b.Author_ID = a.Author_ID
ORDER BY CAST(REPLACE(b.Sale_Amount, ',', '') AS NUMBER) DESC
LIMIT 1;
