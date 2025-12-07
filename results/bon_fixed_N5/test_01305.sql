SELECT a.artistID, a.fname, a.lname, COUNT(p.paintingID) AS oil_painting_count
FROM Artists a
JOIN Paintings p ON a.artistID = p.painterID
WHERE LOWER(p.medium) LIKE '%oil%'
GROUP BY a.artistID, a.fname, a.lname
HAVING COUNT(p.paintingID) = (
    SELECT MAX(oil_count) FROM (
        SELECT COUNT(p2.paintingID) AS oil_count
        FROM Artists a2
        JOIN Paintings p2 ON a2.artistID = p2.painterID
        WHERE LOWER(p2.medium) LIKE '%oil%'
        GROUP BY a2.artistID
    ) AS counts
)
