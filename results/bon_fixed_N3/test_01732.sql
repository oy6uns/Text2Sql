SELECT SUM(Boxes.Value) 
FROM Boxes 
JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code 
WHERE Warehouses.Capacity = (SELECT MAX(Capacity) FROM Warehouses);
