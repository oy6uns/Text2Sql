SELECT DISTINCT m.Rating
FROM Movies m
JOIN MovieTheaters mt ON m.Code = mt.Movie
WHERE mt.Name ILIKE '%Citizen%'
