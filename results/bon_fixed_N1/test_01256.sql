SELECT DISTINCT p1.paintingID
FROM Paintings p1
WHERE EXISTS (
  SELECT 1
  FROM Paintings p2
  WHERE p2.location = 'gallery 240' AND p1.year < p2.year
)
