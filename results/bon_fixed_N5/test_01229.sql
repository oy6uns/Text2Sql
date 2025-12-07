SELECT COUNT(*) 
FROM Paintings 
WHERE painterID = (
    SELECT artistID 
    FROM Artists 
    ORDER BY (COALESCE(deathYear, YEAR(CURRENT_DATE)) - birthYear) DESC 
    LIMIT 1
)
