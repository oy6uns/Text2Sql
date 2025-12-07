SELECT ruc.user_category_description, u.user_id
FROM Users u
JOIN Ref_User_Categories ruc ON u.user_category_code = ruc.user_category_code
WHERE (SELECT COUNT(*) FROM User_Searches us WHERE us.user_id = u.user_id) = 1;
