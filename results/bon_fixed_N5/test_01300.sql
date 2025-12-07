SELECT p1.paintingID
FROM Paintings p1
WHERE p1.year < (SELECT MIN(p2.year)
                 FROM Paintings p2
                 WHERE p2.location = 'gallery 240')
