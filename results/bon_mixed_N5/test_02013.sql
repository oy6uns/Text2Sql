SELECT Name
FROM author a
WHERE NOT EXISTS (
    SELECT 1
    FROM book b
    JOIN press p ON b.Press_ID = p.Press_ID
    WHERE b.Author_ID = a.Author_ID AND p.Name = 'Accor'
)
