SELECT fname
FROM Artists
WHERE artistID = (
    SELECT sculptorID
    FROM Sculptures
    GROUP BY sculptorID
    ORDER BY COUNT(*) DESC
    LIMIT 1
);
