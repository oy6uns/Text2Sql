SELECT AVG(CAST(p.room_count AS FLOAT)) AS average_rooms_with_garden
FROM Properties p
JOIN Property_Features pf ON p.property_id = pf.property_id
JOIN Features f ON pf.feature_id = f.feature_id
WHERE LOWER(f.feature_name) LIKE '%garden%' AND p.room_count IS NOT NULL AND p.room_count <> '';
