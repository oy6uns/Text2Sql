SELECT (deathYear - birthYear) AS age
FROM Artists
WHERE deathYear IS NOT NULL
ORDER BY age ASC
LIMIT 1;
