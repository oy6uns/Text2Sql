SELECT Movies.Title, MovieTheaters.Name
FROM Movies
JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie;
