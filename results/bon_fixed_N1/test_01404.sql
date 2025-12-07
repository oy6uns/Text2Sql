SELECT f.feature_name, f.feature_description
FROM Features f
JOIN Property_Features pf ON f.feature_id = pf.feature_id
GROUP BY f.feature_id, f.feature_name, f.feature_description
ORDER BY COUNT(DISTINCT pf.property_id) DESC
LIMIT 1;
