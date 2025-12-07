SELECT u.user_id, u.user_category_code
FROM Users u
JOIN (
    SELECT user_id
    FROM User_Searches
    GROUP BY user_id
    HAVING COUNT(*) = 1
) us ON u.user_id = us.user_id;
