SELECT DISTINCT rac.age_category_code, rac.age_category_description
FROM Users u
JOIN Ref_Age_Categories rac ON u.age_category_code = rac.age_category_code
WHERE (u.first_name ILIKE '%Mother%' OR u.middle_name ILIKE '%Mother%' OR u.last_name ILIKE '%Mother%' OR u.other_user_details ILIKE '%Mother%');
