SELECT u.first_name, u.middle_name, u.last_name
FROM Users u
JOIN Properties p ON u.user_id = p.owner_user_id
WHERE u.user_address_id = p.property_address_id;
