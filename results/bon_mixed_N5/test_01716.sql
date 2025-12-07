SELECT DISTINCT W.Code, W.Location, W.Capacity
FROM Warehouses W
JOIN Boxes B ON W.Code = B.Warehouse
WHERE B.Contents IN ('Rocks', 'Scissors')
