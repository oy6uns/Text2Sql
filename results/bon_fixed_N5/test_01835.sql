SELECT Title
FROM Movies
JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie
GROUP BY Title
ORDER BY COUNT(*) DESC
LIMIT 1;
