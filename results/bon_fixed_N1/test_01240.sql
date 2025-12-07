SELECT birthYear
FROM Artists a
JOIN Paintings p ON a.artistID = p.painterID
WHERE p.year = 1884 AND (p.medium = 'canvas' OR p.mediumOn = 'canvas')
LIMIT 1;
