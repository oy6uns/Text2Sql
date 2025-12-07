SELECT c.Name
FROM channel c
WHERE EXISTS (
    SELECT 1
    FROM director_admin da
    JOIN director d ON da.Director_ID = d.Director_ID
    WHERE da.Channel_ID = c.Channel_ID AND d.Age < 40
)
AND EXISTS (
    SELECT 1
    FROM director_admin da
    JOIN director d ON da.Director_ID = d.Director_ID
    WHERE da.Channel_ID = c.Channel_ID AND d.Age > 60
)
