SELECT AVG(c.overall_score) AS average_overall_score
FROM countries c
JOIN official_languages ol ON c.id = ol.country_id
JOIN languages l ON ol.language_id = l.id
WHERE l.name = 'English';
