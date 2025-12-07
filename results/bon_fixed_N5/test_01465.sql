SELECT DISTINCT CONCAT_WS(' ', u.first_name, u.middle_name, u.last_name) AS full_name
FROM Users u
JOIN Properties p ON u.user_id = p.owner_user_id
JOIN Addresses a ON u.user_address_id = a.address_id
WHERE p.property_address_id = u.user_address_id;
