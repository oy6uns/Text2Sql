SELECT paintingID 
FROM Paintings 
WHERE year < (SELECT MIN(year) FROM Paintings WHERE location = 'gallery 240')
