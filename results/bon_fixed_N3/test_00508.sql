SELECT 
  sa.address_type_code, 
  rat.address_type_description
FROM 
  Students_Addresses sa
JOIN 
  Ref_Address_Types rat ON sa.address_type_code = rat.address_type_code
GROUP BY 
  sa.address_type_code, 
  rat.address_type_description
ORDER BY 
  COUNT(*) DESC
LIMIT 1;
