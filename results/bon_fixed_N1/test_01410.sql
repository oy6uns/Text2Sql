SELECT DISTINCT rac.age_category_code, rac.age_category_description
FROM Users u
JOIN Ref_Age_Categories rac ON u.age_category_code = rac.age_category_code
WHERE u.other_user_details ILIKE '%Mother%'
