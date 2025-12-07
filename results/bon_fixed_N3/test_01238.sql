SELECT DISTINCT a.fname, a.lname
FROM Artists a
JOIN Paintings p1 ON a.artistID = p1.painterID AND p1.medium = 'oil'
JOIN Paintings p2 ON a.artistID = p2.painterID AND p2.medium = 'lithographic'
