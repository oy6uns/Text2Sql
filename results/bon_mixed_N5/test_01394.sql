SELECT name
FROM countries c
LEFT JOIN official_languages ol ON c.id = ol.country_id
WHERE ol.language_id IS NULL;
