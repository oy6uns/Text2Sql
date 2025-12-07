SELECT fname, lname
FROM Artists
WHERE artistID NOT IN (SELECT DISTINCT sculptorID FROM Sculptures)
  AND artistID IN (SELECT DISTINCT painterID FROM Paintings);
