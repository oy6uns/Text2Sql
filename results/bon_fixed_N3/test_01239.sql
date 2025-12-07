SELECT DISTINCT a.fname, a.lname
FROM Artists a
JOIN Paintings p1 ON a.artistID = p1.painterID AND LOWER(p1.medium) LIKE '%oil%'
JOIN Paintings p2 ON a.artistID = p2.painterID AND LOWER(p2.medium) LIKE '%lithograph%'
