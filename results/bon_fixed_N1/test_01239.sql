SELECT DISTINCT a.fname, a.lname
FROM Artists a
JOIN Paintings p ON a.artistID = p.painterID
WHERE p.medium = 'oil'
INTERSECT
SELECT DISTINCT a.fname, a.lname
FROM Artists a
JOIN Paintings p ON a.artistID = p.painterID
WHERE p.medium = 'lithographic'
