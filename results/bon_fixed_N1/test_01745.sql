SELECT COUNT(DISTINCT W.Location) 
FROM Warehouses W 
JOIN Boxes B ON W.Code = B.Warehouse 
WHERE B.Contents = 'Rocks';
