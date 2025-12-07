SELECT DISTINCT w.Location
FROM Warehouses w
JOIN Boxes b ON w.Code = b.Warehouse
WHERE w.Code IN (
    SELECT Warehouse
    FROM Boxes
    WHERE Contents = 'Rocks'
)
AND w.Code NOT IN (
    SELECT Warehouse
    FROM Boxes
    WHERE Contents = 'Scissors'
);
