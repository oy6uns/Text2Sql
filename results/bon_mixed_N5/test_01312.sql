SELECT DISTINCT p.location
FROM Paintings p
WHERE p.year < 1885
  AND p.location NOT IN (
    SELECT location
    FROM Paintings
    WHERE mediumOn = 'canvas'
  )
