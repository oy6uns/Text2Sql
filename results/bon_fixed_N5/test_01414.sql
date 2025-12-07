SELECT AVG(CAST(room_count AS FLOAT)) AS average_room_count
FROM Properties p
JOIN Property_Features pf ON p.property_id = pf.property_id
JOIN Features f ON pf.feature_id = f.feature_id
WHERE LOWER(f.feature_name) = 'garden';
