SELECT COUNT(*) 
FROM Paintings 
WHERE painterID = (
    SELECT artistID 
    FROM Artists 
    ORDER BY (COALESCE(deathYear, EXTRACT(year FROM CURRENT_DATE)) - birthYear) DESC 
    LIMIT 1
)
