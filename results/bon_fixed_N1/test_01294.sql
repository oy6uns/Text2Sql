SELECT deathYear
FROM Artists a
WHERE (SELECT COUNT(*) FROM Paintings p WHERE p.painterID = a.artistID) <= 3;
