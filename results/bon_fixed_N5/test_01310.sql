SELECT DISTINCT a.fname, a.lname
FROM Artists a
JOIN Paintings p ON a.artistID = p.painterID
WHERE a.artistID NOT IN (SELECT sculptorID FROM Sculptures)
