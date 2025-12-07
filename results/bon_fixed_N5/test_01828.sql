SELECT DISTINCT m.Title
FROM Movies m
WHERE m.Code NOT IN (
    SELECT mt.Movie
    FROM MovieTheaters mt
    JOIN MovieTheaters mt2 ON mt2.Name = 'Odeon'
    WHERE mt.Movie = mt2.Movie
) OR m.Code NOT IN (
    SELECT mt.Movie
    FROM MovieTheaters mt
    WHERE mt.Name = 'Odeon'
);
