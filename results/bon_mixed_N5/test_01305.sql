SELECT a.artistID, a.fname, a.lname, COUNT(p.paintingID) AS oil_paintings_count
FROM Artists a
JOIN Paintings p ON a.artistID = p.painterID
WHERE LOWER(p.medium) LIKE '%oil%'
GROUP BY a.artistID, a.fname, a.lname
HAVING COUNT(p.paintingID) = (
    SELECT MAX(oil_count) FROM (
        SELECT COUNT(p2.paintingID) AS oil_count
        FROM Paintings p2
        WHERE LOWER(p2.medium) LIKE '%oil%'
        GROUP BY p2.painterID
    )
)
