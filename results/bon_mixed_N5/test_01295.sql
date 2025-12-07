SELECT a.lname, a.fname, a.deathYear
FROM Artists a
JOIN (
    SELECT painterID, COUNT(*) AS painting_count
    FROM Paintings
    GROUP BY painterID
    HAVING COUNT(*) < 4
) p ON a.artistID = p.painterID;
