SELECT DISTINCT b1.Type
FROM book b1
JOIN book b2 ON b1.Type = b2.Type
WHERE b1.Chapters > 75
  AND b2.Chapters < 50;
