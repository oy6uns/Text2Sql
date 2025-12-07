SELECT r.property_type_description, r.property_type_code
FROM Ref_Property_Types r
JOIN (
    SELECT property_type_code, COUNT(*) AS cnt
    FROM Properties
    GROUP BY property_type_code
    ORDER BY cnt DESC
    LIMIT 1
) p ON r.property_type_code = p.property_type_code
