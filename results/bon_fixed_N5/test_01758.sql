SELECT SUM(Value) AS total_value FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location <> 'Chicago';
