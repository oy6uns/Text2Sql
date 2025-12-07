SELECT SUM(Boxes.Value) AS total_value
FROM Boxes
JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code
WHERE Warehouses.Location IN ('Chicago', 'New York');
