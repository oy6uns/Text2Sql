SELECT m.Title
FROM Movies m
JOIN MovieTheaters mt ON m.Code = mt.Movie
GROUP BY m.Code, m.Title
ORDER BY COUNT(mt.Code) DESC
LIMIT 1;
