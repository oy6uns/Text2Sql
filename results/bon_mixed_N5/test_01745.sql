SELECT COUNT(DISTINCT w.Location) 
FROM Warehouses w 
JOIN Boxes b ON w.Code = b.Warehouse 
WHERE b.Contents = 'Rocks';
