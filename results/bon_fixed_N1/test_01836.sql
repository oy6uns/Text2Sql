SELECT Title
FROM Movies
WHERE Code = (
  SELECT Movie
  FROM MovieTheaters
  GROUP BY Movie
  ORDER BY COUNT(*) DESC
  LIMIT 1
)
