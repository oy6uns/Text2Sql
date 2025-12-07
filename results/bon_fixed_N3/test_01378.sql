SELECT l.name AS language, COUNT(ol.country_id) AS number_of_countries
FROM languages l
JOIN official_languages ol ON l.id = ol.language_id
GROUP BY l.name
ORDER BY number_of_countries DESC;
