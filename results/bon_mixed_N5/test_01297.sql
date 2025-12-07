SELECT deathYear FROM Artists WHERE artistID IN (
    SELECT sculptorID FROM Sculptures GROUP BY sculptorID
    HAVING COUNT(*) = (
        SELECT MIN(sculpture_count) FROM (
            SELECT COUNT(*) AS sculpture_count FROM Sculptures GROUP BY sculptorID
        ) AS counts
    )
)
