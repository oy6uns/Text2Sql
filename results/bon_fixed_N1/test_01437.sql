SELECT login_name
FROM Users
JOIN Ref_Age_Categories ON Users.age_category_code = Ref_Age_Categories.age_category_code
WHERE Ref_Age_Categories.age_category_description = 'Senior Citizen'
ORDER BY first_name;
