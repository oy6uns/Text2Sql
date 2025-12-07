SELECT DISTINCT us.search_string
FROM User_Searches us
JOIN Users u ON us.user_id = u.user_id
WHERE NOT EXISTS (
    SELECT 1
    FROM Properties p
    WHERE p.owner_user_id = u.user_id
)
