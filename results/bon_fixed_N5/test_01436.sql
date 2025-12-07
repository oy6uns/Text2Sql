SELECT login_name
FROM Users
WHERE age_category_code = (SELECT age_category_code FROM Ref_Age_Categories WHERE LOWER(age_category_description) = 'senior citizen')
ORDER BY first_name;
