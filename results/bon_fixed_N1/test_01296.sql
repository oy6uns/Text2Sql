SELECT deathYear
FROM Artists
WHERE artistID = (
    SELECT sculptorID
    FROM Sculptures
    GROUP BY sculptorID
    ORDER BY COUNT(*) ASC
    LIMIT 1
)
