SELECT l.name
FROM languages l
JOIN official_languages ol ON l.id = ol.language_id
JOIN countries c ON ol.country_id = c.id
GROUP BY l.id, l.name
HAVING 
    COUNT(CASE WHEN c.overall_score > 95 THEN 1 END) > 0
    AND
    COUNT(CASE WHEN c.overall_score < 90 THEN 1 END) > 0;
