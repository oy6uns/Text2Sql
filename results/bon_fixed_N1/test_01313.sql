SELECT DISTINCT location
FROM Paintings
WHERE year < 1885
  AND (medium != 'canvas' OR medium IS NULL);
