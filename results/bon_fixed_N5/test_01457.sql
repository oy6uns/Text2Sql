SELECT 
  p.property_type_code, 
  r.property_type_description, 
  COUNT(*) AS property_count
FROM Properties p
JOIN Ref_Property_Types r ON p.property_type_code = r.property_type_code
GROUP BY p.property_type_code, r.property_type_description
ORDER BY property_count DESC
LIMIT 1;
