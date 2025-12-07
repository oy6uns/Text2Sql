SELECT DISTINCT a.line_1_number_building, a.line_2_number_street, a.town_city
FROM Addresses a
JOIN Users u ON u.user_address_id = a.address_id
JOIN Ref_Age_Categories rac ON u.age_category_code = rac.age_category_code
WHERE LOWER(rac.age_category_description) LIKE '%senior%'
