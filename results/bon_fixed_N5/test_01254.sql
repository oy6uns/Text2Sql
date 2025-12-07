SELECT DISTINCT p1.title
FROM Paintings p1
WHERE p1.height_mm > (
    SELECT MAX(p2.height_mm)
    FROM Paintings p2
    WHERE p2.medium = 'canvas'
)
