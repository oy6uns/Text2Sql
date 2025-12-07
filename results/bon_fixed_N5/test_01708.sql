SELECT SUM(Boxes.Value) 
FROM Boxes 
JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code 
WHERE Warehouses.Location IN ('Chicago', 'New York')
