SELECT DISTINCT A.fname, A.lname
FROM Artists A
JOIN Sculptures S ON A.artistID = S.sculptorID
WHERE S.year < 1900;
