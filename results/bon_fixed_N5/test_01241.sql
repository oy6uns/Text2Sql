SELECT a.birthYear
FROM Artists a
JOIN Paintings p ON a.artistID = p.painterID
WHERE p.year = 1884
LIMIT 1;
