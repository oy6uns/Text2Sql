SELECT DISTINCT p.location, p.medium
FROM Paintings p
JOIN Artists a ON p.painterID = a.artistID
WHERE a.fname = 'Pablo';
