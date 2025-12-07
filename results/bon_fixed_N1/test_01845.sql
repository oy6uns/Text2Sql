SELECT MovieTheaters.Name
FROM MovieTheaters
JOIN Movies ON MovieTheaters.Movie = Movies.Code
WHERE Movies.Rating = 'G';
