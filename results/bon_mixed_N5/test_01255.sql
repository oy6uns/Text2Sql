SELECT DISTINCT p1.title
FROM Paintings p1
WHERE p1.height_mm > ANY (
    SELECT p2.height_mm
    FROM Paintings p2
    WHERE LOWER(p2.medium) LIKE '%canvas%'
);
