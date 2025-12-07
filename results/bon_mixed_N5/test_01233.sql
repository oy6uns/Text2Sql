SELECT width_mm
FROM Paintings p
JOIN Artists a ON p.painterID = a.artistID
WHERE a.birthYear < 1850;
