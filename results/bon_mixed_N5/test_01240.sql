SELECT birthYear
FROM Artists
WHERE artistID = (
  SELECT painterID
  FROM Paintings
  WHERE year = 1884 AND medium = 'canvas'
  LIMIT 1
)
