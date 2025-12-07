SELECT DISTINCT a.fname, a.lname
FROM Artists a
JOIN Sculptures s ON a.artistID = s.sculptorID
WHERE s.year < 1900;
