SELECT l.name, COUNT(ol.country_id) AS country_count
FROM languages l
JOIN official_languages ol ON l.id = ol.language_id
GROUP BY l.name;
