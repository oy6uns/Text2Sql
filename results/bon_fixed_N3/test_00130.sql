SELECT COUNT(*) 
FROM channel c
WHERE NOT EXISTS (
    SELECT 1 
    FROM program p 
    WHERE p.Channel_ID = c.Channel_ID
)
