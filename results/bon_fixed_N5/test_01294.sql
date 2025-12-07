SELECT a.deathYear
FROM Artists a
LEFT JOIN Paintings p ON a.artistID = p.painterID
GROUP BY a.artistID, a.deathYear
HAVING COUNT(p.paintingID) <= 3;
