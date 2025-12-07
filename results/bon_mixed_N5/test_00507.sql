SELECT sat.address_type_code, rat.address_type_description
FROM (
    SELECT address_type_code, COUNT(*) AS cnt
    FROM Students_Addresses
    GROUP BY address_type_code
    ORDER BY cnt DESC
    LIMIT 1
) sat
JOIN Ref_Address_Types rat ON sat.address_type_code = rat.address_type_code;
