SELECT DISTINCT m.Title
FROM Movies m
JOIN MovieTheaters mt ON m.Code = mt.Movie
WHERE mt.Name IN ('Odeon', 'Imperial')
