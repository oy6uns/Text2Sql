SELECT detention_type_code, detention_type_description
FROM Ref_Detention_Type
WHERE detention_type_code = (
    SELECT detention_type_code
    FROM Detention
    GROUP BY detention_type_code
    ORDER BY COUNT(*) ASC
    LIMIT 1
)
