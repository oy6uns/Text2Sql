SELECT fname, lname
FROM Artists
WHERE artistID IN (SELECT painterID FROM Paintings)
  AND artistID NOT IN (SELECT sculptorID FROM Sculptures);
