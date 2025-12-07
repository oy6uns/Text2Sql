SELECT paintingID, height_mm 
FROM Paintings 
WHERE year < 1900 
ORDER BY height_mm DESC 
LIMIT 1;
