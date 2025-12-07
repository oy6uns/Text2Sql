SELECT l.name, COUNT(*) AS country_count
FROM official_languages ol
JOIN languages l ON ol.language_id = l.id
GROUP BY l.name
ORDER BY country_count DESC
LIMIT 3;
