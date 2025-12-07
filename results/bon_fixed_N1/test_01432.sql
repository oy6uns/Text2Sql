SELECT u.user_category_code, u.user_id
FROM Users u
JOIN User_Searches us ON u.user_id = us.user_id
GROUP BY u.user_category_code, u.user_id
HAVING COUNT(us.search_seq) = 1;
