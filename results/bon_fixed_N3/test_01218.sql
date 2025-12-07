SELECT DISTINCT a.birthYear
FROM Artists a
JOIN Sculptures s ON a.artistID = s.sculptorID
WHERE s.year > 1920;
