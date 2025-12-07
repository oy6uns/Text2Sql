SELECT a.fname, a.lname
FROM Artists a
WHERE a.artistID IN (SELECT p.painterID FROM Paintings p)
  AND a.artistID NOT IN (SELECT s.sculptorID FROM Sculptures s)
