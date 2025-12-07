SELECT p.property_type_code, rpt.property_type_description
FROM Properties p
JOIN Ref_Property_Types rpt ON p.property_type_code = rpt.property_type_code
GROUP BY p.property_type_code, rpt.property_type_description
ORDER BY COUNT(*) DESC
LIMIT 1;
