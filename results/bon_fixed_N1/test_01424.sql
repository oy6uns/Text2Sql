SELECT user_id, search_string
FROM User_Searches
GROUP BY user_id, search_string
HAVING COUNT(*) >= 2;
