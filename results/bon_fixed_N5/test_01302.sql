SELECT paintingID
FROM Paintings p1
WHERE height_mm > ALL (
    SELECT height_mm
    FROM Paintings p2
    WHERE year > 1900
);
