SELECT us.search_string
FROM User_Searches us
JOIN Users u ON us.user_id = u.user_id
LEFT JOIN Properties p ON u.user_id = p.owner_user_id
WHERE p.property_id IS NULL;
