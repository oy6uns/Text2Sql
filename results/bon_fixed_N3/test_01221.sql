SELECT fname || ' ' || lname AS full_name
FROM Artists
ORDER BY (COALESCE(deathYear, EXTRACT(year FROM CURRENT_DATE)) - birthYear) DESC
LIMIT 1;
