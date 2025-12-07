SELECT Location
FROM Warehouses w
WHERE EXISTS (
    SELECT 1
    FROM Boxes b
    WHERE b.Warehouse = w.Code AND b.Contents = 'Rocks'
)
AND NOT EXISTS (
    SELECT 1
    FROM Boxes b
    WHERE b.Warehouse = w.Code AND b.Contents = 'Scissors'
)
