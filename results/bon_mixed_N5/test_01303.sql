SELECT paintingID
FROM Paintings
WHERE height_mm > (
    SELECT MAX(height_mm)
    FROM Paintings
    WHERE year > 1900
)
