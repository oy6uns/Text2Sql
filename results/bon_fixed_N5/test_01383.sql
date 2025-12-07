SELECT l.name
FROM languages l
JOIN official_languages ol ON l.id = ol.language_id
GROUP BY l.name
HAVING COUNT(DISTINCT ol.country_id) >= 2;
