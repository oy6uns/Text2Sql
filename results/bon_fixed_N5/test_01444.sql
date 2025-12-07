SELECT a.line_1_number_building, a.line_2_number_street, a.town_city
FROM Users u
JOIN Ref_Age_Categories r ON u.age_category_code = r.age_category_code
JOIN Addresses a ON u.user_address_id = a.address_id
WHERE r.age_category_description = 'Senior Citizens';
