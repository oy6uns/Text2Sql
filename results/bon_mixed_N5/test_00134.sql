SELECT DISTINCT c.Name
FROM channel c
JOIN director_admin da ON c.Channel_ID = da.Channel_ID
JOIN director d ON da.Director_ID = d.Director_ID
WHERE c.Channel_ID IN (
    SELECT Channel_ID FROM director_admin da2
    JOIN director d2 ON da2.Director_ID = d2.Director_ID
    WHERE d2.Age < 40
)
AND c.Channel_ID IN (
    SELECT Channel_ID FROM director_admin da3
    JOIN director d3 ON da3.Director_ID = d3.Director_ID
    WHERE d3.Age > 60
)
