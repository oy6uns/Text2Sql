SELECT l.name AS language, AVG(c.overall_score) AS avg_overall_score
FROM languages l
JOIN official_languages ol ON l.id = ol.language_id
JOIN countries c ON ol.country_id = c.id
GROUP BY l.name
ORDER BY avg_overall_score DESC;
