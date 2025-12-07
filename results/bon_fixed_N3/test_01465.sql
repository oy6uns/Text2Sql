SELECT DISTINCT u.first_name || ' ' || COALESCE(u.middle_name || ' ', '') || u.last_name AS full_name
FROM Users u
JOIN Properties p ON u.user_id = p.owner_user_id
JOIN Addresses a ON u.user_address_id = a.address_id
JOIN Addresses pa ON p.property_address_id = pa.address_id
WHERE u.user_address_id = p.property_address_id;
