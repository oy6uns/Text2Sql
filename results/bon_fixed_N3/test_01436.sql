SELECT login_name
FROM Users
WHERE age_category_code = (SELECT age_category_code FROM Ref_Age_Categories WHERE age_category_description ILIKE '%senior%')
ORDER BY first_name;
