SELECT a.fname, COUNT(*) AS number_of_works
FROM Artists a
JOIN Paintings p ON a.artistID = p.painterID
GROUP BY a.artistID, a.fname
HAVING COUNT(*) >= 2;
