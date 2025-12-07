SELECT DISTINCT A.birthYear
FROM Artists A
JOIN Sculptures S ON A.artistID = S.sculptorID
WHERE S.year > 1920;
