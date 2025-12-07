SELECT DISTINCT w.Code, w.Location, w.Capacity
FROM Warehouses w
JOIN Boxes b ON w.Code = b.Warehouse
WHERE b.Contents IN ('Rocks', 'Scissors')
