SELECT AVG(CAST(room_count AS INTEGER)) AS average_room_count
FROM Properties
WHERE property_id IN (
    SELECT property_id
    FROM Property_Features pf
    JOIN Features f ON pf.feature_id = f.feature_id
    WHERE LOWER(f.feature_name) = 'garden'
)
