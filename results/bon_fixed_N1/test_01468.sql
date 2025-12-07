SELECT u.user_id, u.last_name
FROM Users u
JOIN Properties p ON u.user_id = p.owner_user_id
JOIN (
    SELECT user_id, COUNT(*) AS search_count
    FROM User_Searches
    GROUP BY user_id
) us ON u.user_id = us.user_id
GROUP BY u.user_id, u.last_name, us.search_count
HAVING COUNT(p.property_id) >= 2 AND us.search_count <= 2;
