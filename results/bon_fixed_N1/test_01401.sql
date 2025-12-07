SELECT DISTINCT a.county_state_province
FROM Properties p
JOIN Addresses a ON p.property_address_id = a.address_id
ORDER BY a.county_state_province;
