SELECT DISTINCT a.town_city
FROM Properties p
JOIN Addresses a ON p.property_address_id = a.address_id
JOIN Property_Features pf ON p.property_id = pf.property_id
JOIN Features f ON pf.feature_id = f.feature_id
WHERE LOWER(f.feature_name) = 'swimming pool';
