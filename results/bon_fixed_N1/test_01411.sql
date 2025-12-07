SELECT DISTINCT rac.age_category_code, rac.age_category_description
FROM Users u
JOIN Ref_Age_Categories rac ON u.age_category_code = rac.age_category_code
WHERE u.other_user_details ILIKE '%Mother%' OR u.first_name ILIKE '%Mother%' OR u.middle_name ILIKE '%Mother%' OR u.last_name ILIKE '%Mother%' OR u.login_name ILIKE '%Mother%' OR u.user_category_code IN (
    SELECT user_category_code FROM Ref_User_Categories WHERE user_category_description ILIKE '%Mother%'
)
