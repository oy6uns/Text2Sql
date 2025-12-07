SELECT COUNT(DISTINCT property_id) 
FROM (
  SELECT property_id 
  FROM Property_Features 
  GROUP BY property_id 
  HAVING COUNT(feature_id) >= 2
) sub;
