SELECT DISTINCT location
FROM Paintings
WHERE mediumOn IN ('panel', 'canvas') OR medium IN ('panel', 'canvas')
