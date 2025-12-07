SELECT U.login_name
FROM Users U
JOIN Ref_Age_Categories RAC ON U.age_category_code = RAC.age_category_code
WHERE RAC.age_category_description = 'Senior Citizen'
ORDER BY U.first_name;
