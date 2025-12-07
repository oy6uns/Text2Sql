SELECT AVG(room_count) 
FROM (
  SELECT p.property_id, COUNT(r.room_number) AS room_count
  FROM Properties p
  JOIN Property_Features pf ON p.property_id = pf.property_id
  JOIN Features f ON pf.feature_id = f.feature_id
  LEFT JOIN Rooms r ON p.property_id = r.property_id
  WHERE f.feature_name = 'garden'
  GROUP BY p.property_id
) subquery
