SELECT fname, (COALESCE(deathYear, EXTRACT(year FROM CURRENT_DATE)) - birthYear) AS age
FROM Artists
ORDER BY age DESC
LIMIT 1;
