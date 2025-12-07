SELECT COUNT(*) AS total_searches
FROM User_Searches us
JOIN Users u ON us.user_id = u.user_id
WHERE u.is_buyer = 'Y';
