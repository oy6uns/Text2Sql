SELECT DISTINCT a.fname
FROM Artists a
JOIN Paintings p ON a.artistID = p.painterID
WHERE p.medium = 'oil' AND p.location = 'gallery 241';
