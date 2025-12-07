SELECT m.Title
FROM Movies m
JOIN MovieTheaters mt1 ON m.Code = mt1.Movie
JOIN MovieTheaters mt2 ON m.Code = mt2.Movie
WHERE mt1.Name = 'Odeon' AND mt2.Name = 'Imperial'
