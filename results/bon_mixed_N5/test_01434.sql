SELECT rac.age_category_description
FROM Users u
JOIN User_Searches us ON u.user_id = us.user_id
JOIN Ref_Age_Categories rac ON u.age_category_code = rac.age_category_code
ORDER BY us.search_datetime ASC
LIMIT 1;
