SELECT u.user_id, u.last_name
FROM Users u
JOIN Properties p ON u.user_id = p.owner_user_id
LEFT JOIN User_Searches us ON u.user_id = us.user_id
GROUP BY u.user_id, u.last_name
HAVING COUNT(DISTINCT us.search_seq) <= 2 AND COUNT(DISTINCT p.property_id) >= 2;
