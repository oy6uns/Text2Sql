SELECT COUNT(*) 
FROM Paintings 
WHERE painterID = (
  SELECT artistID 
  FROM Artists 
  ORDER BY (deathYear - birthYear) DESC 
  LIMIT 1
)
