SELECT user_id, search_seq
FROM User_Searches
WHERE user_id IN (
    SELECT user_id
    FROM User_Searches
    GROUP BY user_id
    HAVING COUNT(*) >= 2
)
ORDER BY user_id, search_seq;
