SELECT feature_name, feature_description
FROM Features
WHERE feature_id = (
    SELECT feature_id
    FROM Property_Features
    GROUP BY feature_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);
