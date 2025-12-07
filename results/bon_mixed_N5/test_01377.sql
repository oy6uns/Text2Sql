SELECT c.name AS country_name, l.name AS language_name
FROM countries c
JOIN official_languages ol ON c.id = ol.country_id
JOIN languages l ON ol.language_id = l.id;
