SELECT COUNT(*) 
FROM Paintings p
JOIN Artists a ON p.painterID = a.artistID
WHERE (a.deathYear - a.birthYear) = (
    SELECT MAX(deathYear - birthYear) 
    FROM Artists 
    WHERE deathYear IS NOT NULL AND birthYear IS NOT NULL
);
