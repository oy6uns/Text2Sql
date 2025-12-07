SELECT l.name
FROM languages l
JOIN official_languages ol ON l.id = ol.language_id
JOIN countries c ON ol.country_id = c.id
WHERE l.id IN (
    SELECT language_id
    FROM official_languages ol1
    JOIN countries c1 ON ol1.country_id = c1.id
    WHERE c1.overall_score > 95
)
AND l.id IN (
    SELECT language_id
    FROM official_languages ol2
    JOIN countries c2 ON ol2.country_id = c2.id
    WHERE c2.overall_score < 90
)
GROUP BY l.name;
