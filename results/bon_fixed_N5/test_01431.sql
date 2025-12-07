SELECT DISTINCT a.zip_postcode
FROM Properties p
JOIN Addresses a ON p.property_address_id = a.address_id
WHERE p.owner_user_id IN (
    SELECT owner_user_id
    FROM Properties
    GROUP BY owner_user_id
    HAVING COUNT(*) > 2
)
