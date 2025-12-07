SELECT u.login_name
FROM Users u
JOIN Ref_Age_Categories a ON u.age_category_code = a.age_category_code
WHERE LOWER(a.age_category_description) LIKE '%senior%'
ORDER BY u.first_name;
