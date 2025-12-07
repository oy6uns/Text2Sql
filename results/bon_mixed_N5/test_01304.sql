SELECT a.artistID, a.fname, a.lname, COUNT(p.paintingID) AS oil_paintings_count
FROM Artists a
JOIN Paintings p ON a.artistID = p.painterID
WHERE p.medium = 'oil'
GROUP BY a.artistID, a.fname, a.lname
ORDER BY oil_paintings_count DESC
LIMIT 3;
