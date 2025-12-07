SELECT l.name
FROM languages l
JOIN official_languages ol ON l.id = ol.language_id
JOIN countries c ON ol.country_id = c.id
GROUP BY l.name
ORDER BY AVG(c.overall_score) DESC;
