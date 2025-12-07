SELECT M.Title, MT.Name
FROM Movies M
JOIN MovieTheaters MT ON M.Code = MT.Movie;
