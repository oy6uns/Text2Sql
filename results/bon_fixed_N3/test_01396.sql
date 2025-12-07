SELECT l.name
FROM languages l
JOIN official_languages ol ON l.id = ol.language_id
JOIN countries c ON ol.country_id = c.id
GROUP BY l.name
HAVING 
    COUNT(DISTINCT CASE WHEN c.overall_score > 95 THEN c.id END) > 0
    AND
    COUNT(DISTINCT CASE WHEN c.overall_score < 90 THEN c.id END) > 0;
