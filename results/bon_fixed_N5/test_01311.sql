SELECT fname, lname
FROM Artists
WHERE artistID NOT IN (SELECT sculptorID FROM Sculptures)
  AND artistID IN (SELECT painterID FROM Paintings)
