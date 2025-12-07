SELECT u.user_id, u.user_category_code
FROM Users u
JOIN User_Searches us ON u.user_id = us.user_id
GROUP BY u.user_id, u.user_category_code
HAVING COUNT(us.search_seq) = 1;
