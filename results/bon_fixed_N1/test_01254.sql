SELECT DISTINCT p1.title
FROM Paintings p1
WHERE EXISTS (
  SELECT 1
  FROM Paintings p2
  WHERE p2.medium = 'canvas' AND p1.height_mm > p2.height_mm
)
