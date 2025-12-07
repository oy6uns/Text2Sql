SELECT a.fname, a.lname
FROM Artists a
JOIN Sculptures s ON a.artistID = s.sculptorID
WHERE LOWER(s.title) LIKE '%female%'
