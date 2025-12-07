SELECT mt.Name
FROM MovieTheaters mt
JOIN Movies m ON mt.Movie = m.Code
WHERE m.Rating IN ('G', 'PG')
