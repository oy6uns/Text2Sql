SELECT address_type_code, address_type_description
FROM Ref_Address_Types
WHERE address_type_code = (
    SELECT address_type_code
    FROM Students_Addresses
    GROUP BY address_type_code
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
