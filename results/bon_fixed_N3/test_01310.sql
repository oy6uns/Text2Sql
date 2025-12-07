SELECT a.fname, a.lname
FROM Artists a
JOIN Paintings p ON a.artistID = p.painterID
WHERE a.artistID NOT IN (SELECT sculptorID FROM Sculptures)
GROUP BY a.artistID, a.fname, a.lname;
