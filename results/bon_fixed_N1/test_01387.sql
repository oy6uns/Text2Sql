SELECT l.name
FROM languages l
JOIN official_languages ol ON l.id = ol.language_id
GROUP BY l.id, l.name
ORDER BY COUNT(DISTINCT ol.country_id) DESC
LIMIT 3;
