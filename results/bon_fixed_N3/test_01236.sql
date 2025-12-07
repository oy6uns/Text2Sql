SELECT DISTINCT a.fname, a.lname
FROM Artists a
JOIN Paintings p ON a.artistID = p.painterID
JOIN Sculptures s ON a.artistID = s.sculptorID;
