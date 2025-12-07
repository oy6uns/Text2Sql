SELECT DISTINCT a.fname || ' ' || a.lname AS full_name
FROM Artists a
JOIN Paintings p ON a.artistID = p.painterID
JOIN Sculptures s ON a.artistID = s.sculptorID;
