SELECT r.property_type_code, r.property_type_description
FROM Ref_Property_Types r
JOIN (
    SELECT property_type_code, COUNT(*) AS property_count
    FROM Properties
    GROUP BY property_type_code
    ORDER BY property_count DESC
    LIMIT 1
) p ON r.property_type_code = p.property_type_code
