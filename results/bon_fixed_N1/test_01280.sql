SELECT DISTINCT location
FROM Paintings
WHERE LOWER(mediumOn) IN ('on panel', 'on canvas') AND location IS NOT NULL;
