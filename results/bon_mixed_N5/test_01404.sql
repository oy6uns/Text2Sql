SELECT f.feature_name, f.feature_description
FROM Features f
JOIN (
    SELECT feature_id
    FROM Property_Features
    GROUP BY feature_id
    ORDER BY COUNT(DISTINCT property_id) DESC
    LIMIT 1
) pf ON f.feature_id = pf.feature_id
