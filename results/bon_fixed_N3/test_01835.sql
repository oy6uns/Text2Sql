SELECT Title
FROM Movies
JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie
GROUP BY Title
ORDER BY COUNT(MovieTheaters.Code) DESC
LIMIT 1;
