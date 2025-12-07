SELECT fname, lname
FROM Artists
ORDER BY (deathYear - birthYear) DESC
LIMIT 1;
