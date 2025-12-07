SELECT detention_type_code, detention_type_description
FROM Ref_Detention_Type
WHERE detention_type_code IN (
    SELECT detention_type_code
    FROM Detention
    GROUP BY detention_type_code
    HAVING COUNT(*) = (
        SELECT MIN(counts) FROM (
            SELECT COUNT(*) AS counts
            FROM Detention
            GROUP BY detention_type_code
        )
    )
)
