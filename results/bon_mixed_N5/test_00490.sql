SELECT r.detention_type_code, r.detention_type_description
FROM Ref_Detention_Type r
JOIN (
    SELECT detention_type_code
    FROM Detention
    GROUP BY detention_type_code
    ORDER BY COUNT(*) ASC
    LIMIT 1
) d ON r.detention_type_code = d.detention_type_code;
