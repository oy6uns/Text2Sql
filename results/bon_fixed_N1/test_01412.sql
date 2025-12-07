SELECT first_name
FROM Users
WHERE user_id = (
    SELECT owner_user_id
    FROM Properties
    GROUP BY owner_user_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);
