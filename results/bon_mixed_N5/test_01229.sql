SELECT COUNT(*) 
FROM Paintings 
WHERE painterID = (
    SELECT artistID 
    FROM Artists 
    WHERE (deathYear - birthYear) = (
        SELECT MAX(deathYear - birthYear) 
        FROM Artists
    )
);
