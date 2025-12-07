SELECT a.line_1_number_building, a.line_2_number_street, a.town_city
FROM Users u
JOIN Addresses a ON u.user_address_id = a.address_id
WHERE u.age_category_code = (
    SELECT age_category_code 
    FROM Ref_Age_Categories 
    WHERE LOWER(age_category_description) = 'senior citizens'
)
