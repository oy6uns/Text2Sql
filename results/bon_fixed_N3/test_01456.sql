SELECT property_type_code, property_type_description
FROM Ref_Property_Types
WHERE property_type_code = (
    SELECT property_type_code
    FROM Properties
    GROUP BY property_type_code
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
