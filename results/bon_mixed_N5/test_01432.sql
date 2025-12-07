SELECT U.user_category_code, U.user_id
FROM Users U
JOIN (
    SELECT user_id
    FROM User_Searches
    GROUP BY user_id
    HAVING COUNT(*) = 1
) US ON U.user_id = US.user_id;
