SELECT p.title, a.fname, a.lname
FROM Paintings p
JOIN Artists a ON p.painterID = a.artistID
WHERE p.medium = 'oil' AND p.year > 1910;
