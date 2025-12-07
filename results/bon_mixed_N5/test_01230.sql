SELECT p.title, p.year
FROM Paintings p
JOIN Artists a ON p.painterID = a.artistID
WHERE a.fname = 'Mary'
