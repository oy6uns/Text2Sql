SELECT (deathYear - birthYear) AS age
FROM Artists
WHERE (deathYear - birthYear) = (
  SELECT MIN(deathYear - birthYear)
  FROM Artists
  WHERE deathYear IS NOT NULL AND birthYear IS NOT NULL
) AND deathYear IS NOT NULL AND birthYear IS NOT NULL;
