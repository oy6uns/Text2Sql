SELECT l.name
FROM official_languages ol
JOIN languages l ON ol.language_id = l.id
GROUP BY l.id, l.name
ORDER BY COUNT(*) DESC
LIMIT 3;
