SELECT fname, 
       (COALESCE(deathYear, YEAR(CURRENT_DATE)) - birthYear) AS age_lived
FROM Artists
ORDER BY age_lived DESC
LIMIT 1;
