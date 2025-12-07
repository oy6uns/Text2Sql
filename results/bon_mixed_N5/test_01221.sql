SELECT fname || ' ' || lname AS full_name
FROM Artists
ORDER BY (deathYear - birthYear) DESC
LIMIT 1;
