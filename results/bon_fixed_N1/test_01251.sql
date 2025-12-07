SELECT p.title 
FROM Paintings p 
WHERE (p.medium = 'oil' OR p.mediumOn LIKE 'oil%') 
  AND p.year > 1910;
