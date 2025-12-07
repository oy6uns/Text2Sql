SELECT d.detention_type_code, r.detention_type_description
FROM Detention d
JOIN Ref_Detention_Type r ON d.detention_type_code = r.detention_type_code
GROUP BY d.detention_type_code, r.detention_type_description
HAVING COUNT(*) = (
    SELECT MIN(counts) FROM (
        SELECT COUNT(*) AS counts
        FROM Detention
        GROUP BY detention_type_code
    ) AS sub
)
