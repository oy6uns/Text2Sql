SELECT M.Title
FROM Movies M
JOIN MovieTheaters MT ON M.Code = MT.Movie
WHERE MT.Name = 'Odeon'
