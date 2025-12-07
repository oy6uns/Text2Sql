SELECT DISTINCT rac.age_category_code, rac.age_category_description
FROM Users u
JOIN Ref_User_Categories ruc ON u.user_category_code = ruc.user_category_code
JOIN Ref_Age_Categories rac ON u.age_category_code = rac.age_category_code
WHERE ruc.user_category_description LIKE '%Mother%'
