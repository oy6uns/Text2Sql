SELECT M.Title
FROM Movies M
JOIN MovieTheaters MT1 ON M.Code = MT1.Movie
JOIN MovieTheaters MT2 ON M.Code = MT2.Movie
WHERE MT1.Name = 'Odeon' AND MT2.Name = 'Imperial';
