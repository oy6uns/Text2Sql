SELECT a.fname, COUNT(p.paintingID) AS num_works
FROM Artists a
JOIN Paintings p ON a.artistID = p.painterID
GROUP BY a.artistID, a.fname
HAVING COUNT(p.paintingID) >= 2;
