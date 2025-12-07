SELECT birthYear 
FROM Artists 
WHERE artistID = (
    SELECT painterID 
    FROM Paintings 
    WHERE year = 1884 
    LIMIT 1
);
