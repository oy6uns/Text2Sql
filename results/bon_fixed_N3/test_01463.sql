SELECT a.country
FROM Users u
JOIN Addresses a ON u.user_address_id = a.address_id
WHERE u.first_name = 'Robbie'
LIMIT 1;
