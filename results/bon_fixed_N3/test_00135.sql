SELECT c.Channel_ID, c.Name
FROM channel c
WHERE c.Channel_ID NOT IN (
    SELECT DISTINCT p.Channel_ID
    FROM program p
    JOIN director d ON p.Director_ID = d.Director_ID
    WHERE d.Name = 'Hank Baskett'
) AND c.Channel_ID NOT IN (
    SELECT da.Channel_ID
    FROM director_admin da
    JOIN director d ON da.Director_ID = d.Director_ID
    WHERE d.Name = 'Hank Baskett'
)
