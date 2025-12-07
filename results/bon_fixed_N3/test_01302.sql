SELECT paintingID
FROM Paintings
WHERE height_mm > ALL (
    SELECT height_mm
    FROM Paintings
    WHERE year > 1900
)
