SELECT c.Name, c.Internet
FROM channel c
JOIN (
    SELECT Channel_ID, COUNT(DISTINCT Director_ID) AS director_count
    FROM director_admin
    GROUP BY Channel_ID
    ORDER BY director_count DESC
    LIMIT 1
) da ON c.Channel_ID = da.Channel_ID
