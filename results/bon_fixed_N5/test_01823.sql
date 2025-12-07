SELECT DISTINCT M.Title
FROM Movies M
JOIN MovieTheaters MT ON M.Code = MT.Movie
WHERE MT.Name IN ('Odeon', 'Imperial')
