SELECT u.user_id, u.last_name
FROM Users u
JOIN (
    SELECT owner_user_id
    FROM Properties
    GROUP BY owner_user_id
    HAVING COUNT(property_id) >= 2
) p ON u.user_id = p.owner_user_id
LEFT JOIN (
    SELECT user_id, COUNT(search_seq) AS search_count
    FROM User_Searches
    GROUP BY user_id
) s ON u.user_id = s.user_id
WHERE COALESCE(s.search_count, 0) <= 2;
