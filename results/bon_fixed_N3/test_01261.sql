SELECT CONCAT(fname, ' ', lname) AS full_name
FROM Artists a
JOIN Sculptures s ON a.artistID = s.sculptorID
WHERE LOWER(s.title) LIKE '%female%';
