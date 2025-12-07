SELECT fname, 
       (COALESCE(deathYear, YEAR(CURRENT_DATE)) - birthYear) AS age
FROM Artists
ORDER BY age DESC
LIMIT 1;
